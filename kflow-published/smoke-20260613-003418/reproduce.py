#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
import tarfile
import urllib.request
from pathlib import Path

ASSET_URL = 'https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-9594a340fe80/kflow-flow-9594a340fe80-outputs.tar.gz'
ASSET_API_URL = 'https://api.github.com/repos/kyuhank/AnalysisFlowDemo/releases/assets/446191572'
ASSET_NAME = 'kflow-flow-9594a340fe80-outputs.tar.gz'
ASSET_SHA256 = 'd1bea4a792625731c6d96ae23797eb591d170b76e16f863a44e922f53f8f59b8'


def load_manifest():
    return json.loads(Path("manifest.json").read_text(encoding="utf-8"))


def download():
    target = Path(ASSET_NAME)
    if target.exists():
        return target
    token = os.getenv("GITHUB_TOKEN") or os.getenv("GH_TOKEN") or ""
    url = ASSET_API_URL if token and ASSET_API_URL else ASSET_URL
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
        handle.extractall(".", filter="data")
    print(f"Fetched and extracted {archive}")


def verify():
    manifest = load_manifest()
    missing = []
    mismatched = []
    for node in manifest.get("nodes", []):
        for output in node.get("outputs", []):
            path = Path(output["bundle_path"])
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
        print(f"- {node.get('task')}: {node.get('title')} ({len(node.get('outputs', []))} outputs)")


def clean():
    shutil.rmtree("outputs", ignore_errors=True)
    Path(ASSET_NAME).unlink(missing_ok=True)
    print("Removed downloaded output bundle and extracted outputs.")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("command", nargs="?", default="all", choices=["all", "fetch", "verify", "summary", "clean"])
    args = parser.parse_args()
    if args.command in {"all", "fetch"}:
        fetch()
    if args.command in {"all", "verify"}:
        verify()
    if args.command in {"all", "summary"}:
        summary()
    if args.command == "clean":
        clean()


if __name__ == "__main__":
    main()
