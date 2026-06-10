#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="${OUTPUT_DIR:-outputs}"
mkdir -p "${OUT_DIR}"
Rscript task.R
