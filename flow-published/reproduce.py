#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
import subprocess
import tarfile
import urllib.request
from pathlib import Path

ASSET_URL = "https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz"
ASSET_API_URL = "https://api.github.com/repos/kyuhank/AnalysisFlowDemo/releases/assets/448685637"
ASSET_NAME = "kflow-flow-398592774392-outputs.tar.gz"
ASSET_SHA256 = "67883b6b1e210eb43520d88a681b2984e7022d266d6ab320d7b49302f4effa5c"
ROOT = Path(__file__).resolve().parent
RERUN_ROOT = ROOT / "rerun-work"
SOURCE_ROOT = RERUN_ROOT / "source"
INPUT_ROOT = RERUN_ROOT / "inputs"
OUTPUT_ROOT = RERUN_ROOT / "outputs"


def load_manifest():
    return json.loads((ROOT / "manifest.json").read_text(encoding="utf-8"))


def manifest_nodes(manifest):
    return [node for node in manifest.get("nodes", []) if isinstance(node, dict)]


def node_id(node):
    return str(node.get("id") or "")


def node_slug(node):
    return str(node.get("slug") or node_id(node) or "job")


def node_label(node):
    task = node.get("task") or node.get("task_code") or "Task"
    title = node.get("title") or node_slug(node)
    return f"{task}: {title}"


def build_graph(manifest):
    nodes = manifest_nodes(manifest)
    by_id = {node_id(node): node for node in nodes if node_id(node)}
    by_slug = {node_slug(node): node for node in nodes if node_slug(node)}
    order = {node_id(node): index for index, node in enumerate(nodes) if node_id(node)}
    parents_by_id = {node_id(node): [] for node in nodes if node_id(node)}
    for edge in manifest.get("edges", []):
        if not isinstance(edge, dict):
            continue
        parent_id = str(edge.get("from") or "")
        child_id = str(edge.get("to") or "")
        if parent_id in by_id and child_id in by_id and parent_id not in parents_by_id.setdefault(child_id, []):
            parents_by_id[child_id].append(parent_id)
    for node in nodes:
        child_id = node_id(node)
        if not child_id:
            continue
        for link in node.get("inputs", []):
            if not isinstance(link, dict):
                continue
            parent_id = str(link.get("id") or "")
            if parent_id in by_id and parent_id not in parents_by_id.setdefault(child_id, []):
                parents_by_id[child_id].append(parent_id)
    return nodes, by_id, by_slug, parents_by_id, order


def download():
    target = ROOT / ASSET_NAME
    if target.exists():
        return target
    token = os.getenv("GITHUB_TOKEN") or os.getenv("GH_TOKEN") or ""
    url = ASSET_API_URL if token and ASSET_API_URL else ASSET_URL
    if not url:
        raise SystemExit("No release asset URL is recorded in manifest.json.")
    headers = {"User-Agent": "Kflow"}
    if token and ASSET_API_URL:
        headers["Authorization"] = f"Bearer {token}"
        headers["Accept"] = "application/octet-stream"
    request = urllib.request.Request(url, headers=headers)
    with urllib.request.urlopen(request) as response, target.open("wb") as handle:
        shutil.copyfileobj(response, handle)
    return target


def sha256(path):
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def fetch():
    archive = download()
    if ASSET_SHA256 and sha256(archive) != ASSET_SHA256:
        raise SystemExit(f"Checksum mismatch for {archive}")
    with tarfile.open(archive, "r:gz") as handle:
        try:
            handle.extractall(ROOT, filter="data")
        except TypeError:
            handle.extractall(ROOT)
    print(f"Fetched and extracted {archive}")


def verify():
    manifest = load_manifest()
    missing = []
    mismatched = []
    for node in manifest_nodes(manifest):
        for output in node.get("outputs", []):
            path = ROOT / output["bundle_path"]
            if not path.exists():
                missing.append(str(path))
                continue
            expected = output.get("sha256")
            if expected and sha256(path) != expected:
                mismatched.append(str(path))
    if missing or mismatched:
        for path in missing:
            print(f"missing: {path}")
        for path in mismatched:
            print(f"checksum mismatch: {path}")
        raise SystemExit(1)
    print("All published outputs are present and verified.")


def summary():
    manifest = load_manifest()
    snapshot = manifest.get("snapshot", {})
    print(snapshot.get("title") or "Kflow published flow")
    for index, node in enumerate(manifest_nodes(manifest), start=1):
        outputs = len(node.get("outputs", []))
        inputs = len(node.get("inputs", []))
        print(f"{index:>2}. {node_slug(node):<32} {node_label(node)} ({inputs} inputs, {outputs} outputs)")


def list_nodes():
    manifest = load_manifest()
    nodes, _by_id, _by_slug, parents_by_id, _order = build_graph(manifest)
    for index, node in enumerate(nodes, start=1):
        parents = parents_by_id.get(node_id(node), [])
        print(f"{index:>2}. {node_slug(node):<32} {node_label(node)} [{len(parents)} upstream]")


def rerun_plan():
    plan = ROOT / "rerun-plan.md"
    print(plan.read_text(encoding="utf-8") if plan.exists() else "No rerun-plan.md found.")


def resolve_node(selector, nodes, by_id, by_slug):
    token = str(selector or "").strip()
    if not token:
        raise SystemExit("Node selector cannot be empty.")
    if token.isdigit():
        index = int(token)
        if 1 <= index <= len(nodes):
            return nodes[index - 1]
    if token in by_slug:
        return by_slug[token]
    if token in by_id:
        return by_id[token]
    needle = token.casefold()
    matches = [
        node
        for node in nodes
        if needle in node_slug(node).casefold() or needle in node_label(node).casefold()
    ]
    if len(matches) == 1:
        return matches[0]
    if matches:
        print("Selector matched multiple nodes:")
        for node in matches[:12]:
            print(f"- {node_slug(node)}  {node_label(node)}")
        raise SystemExit("Use the exact node slug or number from `python reproduce.py list-nodes`.")
    raise SystemExit(f"No node matched: {token}")


def selected_node_ids(manifest, selectors, include_deps=True):
    nodes, by_id, by_slug, parents_by_id, order = build_graph(manifest)
    if not selectors:
        return [node_id(node) for node in nodes if node_id(node)]
    target_ids = [node_id(resolve_node(selector, nodes, by_id, by_slug)) for selector in selectors]
    selected = set()

    def add_with_parents(current_id):
        if current_id in selected:
            return
        if include_deps:
            for parent_id in parents_by_id.get(current_id, []):
                add_with_parents(parent_id)
        selected.add(current_id)

    for target_id in target_ids:
        add_with_parents(target_id)
    return sorted(selected, key=lambda item: order.get(item, 999999))


def directory_has_content(path):
    return path.exists() and any(path.iterdir())


def copytree_contents(source, target):
    source = Path(source)
    target = Path(target)
    if not source.exists():
        return
    target.mkdir(parents=True, exist_ok=True)
    for item in source.iterdir():
        destination = target / item.name
        if item.is_dir():
            shutil.copytree(item, destination, dirs_exist_ok=True)
        else:
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(item, destination)


def checkout_source(node):
    repo = str(node.get("repo") or "")
    if "/" not in repo:
        raise SystemExit(f"Source repository is not recorded for {node_label(node)}.")
    slug = node_slug(node)
    checkout = SOURCE_ROOT / slug
    checkout.parent.mkdir(parents=True, exist_ok=True)
    if not (checkout / ".git").exists():
        subprocess.run(["git", "clone", f"https://github.com/{repo}.git", str(checkout)], check=True)
    else:
        subprocess.run(["git", "fetch", "--all", "--tags", "--quiet"], cwd=checkout, check=False)
    ref = str(node.get("commit") or node.get("branch") or "main")
    subprocess.run(["git", "checkout", ref], cwd=checkout, check=True)
    folder = str(node.get("folder") or "").strip()
    workdir = checkout / folder if folder else checkout
    if not workdir.exists():
        raise SystemExit(f"Recorded source folder does not exist after checkout: {workdir}")
    return checkout, workdir


def command_for_node(node):
    command = str(node.get("command") or "").strip()
    if command:
        return command
    make_target = str(node.get("make_target") or "").strip()
    if make_target:
        return f"make {make_target}"
    return ""


def public_env_values(node):
    values = {}
    for source in (node.get("env"), node.get("job_config")):
        if isinstance(source, dict):
            for key, value in source.items():
                if key is not None and value is not None:
                    values[str(key)] = str(value)
    return values


def find_existing_outputs(parent_node):
    slug = node_slug(parent_node)
    for candidate in (OUTPUT_ROOT / slug, ROOT / "nodes" / slug / "outputs"):
        if directory_has_content(candidate):
            return candidate
    return None


def prepare_node_inputs(node, by_id, parents_by_id, input_dir):
    shutil.rmtree(input_dir, ignore_errors=True)
    input_dir.mkdir(parents=True, exist_ok=True)
    for parent_id in parents_by_id.get(node_id(node), []):
        parent_node = by_id.get(parent_id)
        if not parent_node:
            continue
        parent_outputs = find_existing_outputs(parent_node)
        if not parent_outputs:
            raise SystemExit(
                f"Missing dependency outputs for {node_label(node)}: {node_label(parent_node)}. "
                "Run with dependencies enabled or restore saved outputs first."
            )
        copytree_contents(parent_outputs, input_dir / node_slug(parent_node))


def run_command(node, checkout, workdir, command, env, input_dir, output_dir):
    image = str(node.get("docker_image") or "").strip()
    if os.getenv("KFLOW_USE_DOCKER") == "1" and image:
        try:
            rel_workdir = workdir.resolve().relative_to(checkout.resolve()).as_posix()
        except ValueError:
            rel_workdir = "."
        docker_workdir = "/workspace" if rel_workdir in {"", "."} else f"/workspace/{rel_workdir}"
        docker_env = public_env_values(node)
        docker_env.update(
            {
                "INPUT_DIR": "/inputs",
                "OUTPUT_DIR": "/outputs",
                "KFLOW_INPUT_DIR": "/inputs",
                "KFLOW_OUTPUT_DIR": "/outputs",
                "KFLOW_NODE_SLUG": node_slug(node),
                "KFLOW_PUBLISHED_REPRODUCE": "1",
            }
        )
        docker_args = ["docker", "run", "--rm", "-v", f"{checkout.resolve()}:/workspace", "-v", f"{input_dir.resolve()}:/inputs", "-v", f"{output_dir.resolve()}:/outputs", "-w", docker_workdir]
        for key, value in sorted(docker_env.items()):
            docker_args.extend(["-e", f"{key}={value}"])
        docker_args.extend([image, "sh", "-lc", command])
        subprocess.run(docker_args, check=True)
    else:
        subprocess.run(command, cwd=workdir, env=env, shell=True, check=True)


def mirror_outputs(slug, output_dir, workdir):
    source_outputs = workdir / "outputs"
    if not directory_has_content(output_dir) and directory_has_content(source_outputs):
        copytree_contents(source_outputs, output_dir)
    public_outputs = ROOT / "nodes" / slug / "outputs"
    shutil.rmtree(public_outputs, ignore_errors=True)
    public_outputs.mkdir(parents=True, exist_ok=True)
    if directory_has_content(output_dir):
        copytree_contents(output_dir, public_outputs)


def run_one_node(node, by_id, parents_by_id):
    slug = node_slug(node)
    command = command_for_node(node)
    if not command:
        raise SystemExit(f"No command or make target is recorded for {node_label(node)}.")
    checkout, workdir = checkout_source(node)
    input_dir = INPUT_ROOT / slug
    output_dir = OUTPUT_ROOT / slug
    shutil.rmtree(output_dir, ignore_errors=True)
    output_dir.mkdir(parents=True, exist_ok=True)
    prepare_node_inputs(node, by_id, parents_by_id, input_dir)
    env = os.environ.copy()
    env.update(public_env_values(node))
    env.update(
        {
            "INPUT_DIR": str(input_dir.resolve()),
            "OUTPUT_DIR": str(output_dir.resolve()),
            "KFLOW_INPUT_DIR": str(input_dir.resolve()),
            "KFLOW_OUTPUT_DIR": str(output_dir.resolve()),
            "KFLOW_NODE_SLUG": slug,
            "KFLOW_PUBLISHED_REPRODUCE": "1",
        }
    )
    print(f"running {slug}: {node_label(node)}")
    run_command(node, checkout, workdir, command, env, input_dir, output_dir)
    mirror_outputs(slug, output_dir, workdir)
    print(f"outputs: {output_dir}")


def run_local(selectors=None, include_deps=True):
    if os.getenv("KFLOW_ALLOW_RERUN") != "1":
        print("Local rerun is opt-in because it executes recorded commands.")
        print("Run with KFLOW_ALLOW_RERUN=1 after reviewing rerun-plan.md.")
        print("Saved outputs can be restored safely with: make")
        return
    manifest = load_manifest()
    nodes, by_id, _by_slug, parents_by_id, _order = build_graph(manifest)
    ids = selected_node_ids(manifest, selectors or [], include_deps=include_deps)
    selected = [by_id[item] for item in ids if item in by_id]
    if not selected:
        raise SystemExit("No nodes selected.")
    print("Selected run:")
    for node in selected:
        print(f"- {node_slug(node)}  {node_label(node)}")
    SOURCE_ROOT.mkdir(parents=True, exist_ok=True)
    INPUT_ROOT.mkdir(parents=True, exist_ok=True)
    OUTPUT_ROOT.mkdir(parents=True, exist_ok=True)
    for node in selected:
        run_one_node(node, by_id, parents_by_id)


def clean():
    manifest = load_manifest()
    for node in manifest_nodes(manifest):
        slug = node_slug(node)
        if slug:
            shutil.rmtree(ROOT / "nodes" / slug / "outputs", ignore_errors=True)
    shutil.rmtree(RERUN_ROOT, ignore_errors=True)
    (ROOT / ASSET_NAME).unlink(missing_ok=True)
    print("Removed downloaded output bundle, rerun-work, and extracted node output folders.")


def main():
    parser = argparse.ArgumentParser(description="Restore or rerun a published Kflow package without requiring Kflow.")
    parser.add_argument(
        "command",
        nargs="?",
        default="all",
        choices=["all", "fetch", "verify", "summary", "clean", "rerun-plan", "rerun-local", "run-local", "run-node", "list-nodes"],
    )
    parser.add_argument("nodes", nargs="*", help="Node slug, 1-based number, id, or a unique title fragment.")
    parser.add_argument("--no-deps", action="store_true", help="Run only selected nodes; dependency outputs must already exist.")
    args = parser.parse_args()
    if args.command in {"all", "fetch"}:
        fetch()
    if args.command in {"all", "verify"}:
        verify()
    if args.command in {"all", "summary"}:
        summary()
    if args.command == "rerun-plan":
        rerun_plan()
    if args.command == "list-nodes":
        list_nodes()
    if args.command in {"rerun-local", "run-local"}:
        run_local(args.nodes, include_deps=not args.no_deps)
    if args.command == "run-node":
        if not args.nodes:
            raise SystemExit("Usage: python reproduce.py run-node <node-slug-or-number> [--no-deps]")
        run_local(args.nodes, include_deps=not args.no_deps)
    if args.command == "clean":
        clean()


if __name__ == "__main__":
    main()
