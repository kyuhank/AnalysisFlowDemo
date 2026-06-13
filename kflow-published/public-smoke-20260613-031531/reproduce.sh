#!/usr/bin/env bash
set -euo pipefail
python3 reproduce.py "${1:-all}"
