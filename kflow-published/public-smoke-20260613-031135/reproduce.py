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

ASSET_URL = 'https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031135/kflow-flow-da59c4949540-public-smoke-20260613-031135-outputs.tar.gz'
ASSET_API_URL = 'https://api.github.com/repos/kyuhank/AnalysisFlowDemo/releases/assets/446273787'
ASSET_NAME = 'kflow-flow-da59c4949540-public-smoke-20260613-031135-outputs.tar.gz'
ASSET_SHA256 = '5d2715238e67d20e86ee3c45348cdbbf4dbd92f4ac3c23040cc0b31a8128165d'
ROOT = Path(__file__).resolve().parent


def load_manifest():
    return json.loads((ROOT / "manifest.json").read_text(encoding="utf-8"))


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
        handle.extractall(ROOT, filter="data")
    print(f"Fetched and extracted {archive}")


def verify():
    manifest = load_manifest()
    missing = []
    mismatched = []
    for node in manifest.get("nodes", []):
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
    print(manifest["snapshot"]["title"])
    for node in manifest.get("nodes", []):
        outputs = len(node.get("outputs", []))
        inputs = len(node.get("inputs", []))
        print(f"- {node.get('task')}: {node.get('title')} ({inputs} inputs, {outputs} outputs)")


def rerun_plan():
    plan = ROOT / "rerun-plan.md"
    print(plan.read_text(encoding="utf-8") if plan.exists() else "No rerun-plan.md found.")


def rerun_local():
    manifest = load_manifest()
    if os.getenv("KFLOW_ALLOW_RERUN") != "1":
        print("Best-effort local rerun is available, but it is intentionally opt-in.")
        print("Run with KFLOW_ALLOW_RERUN=1 after checking rerun-plan.md.")
        print("Saved outputs can be restored safely with: make")
        return
    root = ROOT / "rerun-work"
    root.mkdir(exist_ok=True)
    for node in manifest.get("nodes", []):
        repo = node.get("repo") or ""
        command = node.get("command") or ""
        if "/" not in repo or not command:
            print(f"skip {node.get('title')}: source or command not recorded")
            continue
        slug = node["slug"]
        checkout = root / "source" / slug
        checkout.parent.mkdir(parents=True, exist_ok=True)
        if not checkout.exists():
            subprocess.run(["git", "clone", f"https://github.com/{repo}.git", str(checkout)], check=True)
        commit = node.get("commit") or node.get("branch") or "main"
        subprocess.run(["git", "checkout", str(commit)], cwd=checkout, check=True)
        workdir = checkout / (node.get("folder") or ".")
        env = os.environ.copy()
        env.update({str(k): str(v) for k, v in node.get("job_config", {}).items()})
        env["INPUT_DIR"] = str((root / "inputs" / slug).resolve())
        env["OUTPUT_DIR"] = str((root / "outputs" / slug).resolve())
        Path(env["INPUT_DIR"]).mkdir(parents=True, exist_ok=True)
        Path(env["OUTPUT_DIR"]).mkdir(parents=True, exist_ok=True)
        print(f"running {node.get('task')}: {node.get('title')}")
        subprocess.run(command, cwd=workdir, env=env, shell=True, check=True)


def clean():
    manifest = load_manifest()
    for node in manifest.get("nodes", []):
        slug = node.get("slug") or ""
        if slug:
            shutil.rmtree(ROOT / "nodes" / slug / "outputs", ignore_errors=True)
    (ROOT / ASSET_NAME).unlink(missing_ok=True)
    print("Removed downloaded output bundle and extracted node output folders.")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("command", nargs="?", default="all", choices=["all", "fetch", "verify", "summary", "clean", "rerun-plan", "rerun-local"])
    args = parser.parse_args()
    if args.command in {"all", "fetch"}:
        fetch()
    if args.command in {"all", "verify"}:
        verify()
    if args.command in {"all", "summary"}:
        summary()
    if args.command == "rerun-plan":
        rerun_plan()
    if args.command == "rerun-local":
        rerun_local()
    if args.command == "clean":
        clean()


if __name__ == "__main__":
    main()
