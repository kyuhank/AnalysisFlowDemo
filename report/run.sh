#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="${OUTPUT_DIR:-outputs}"
IN_DIR="${INPUT_DIR:-inputs}"
mkdir -p "${OUT_DIR}"

plot_count="$(find "${IN_DIR}" -type f -name plot-summary.csv | wc -l | tr -d ' ')"
if [[ "${plot_count}" -lt 1 ]]; then
  echo "No Plot outputs found under ${IN_DIR}" >&2
  find "${IN_DIR}" -maxdepth 5 -type f -print | sort >&2 || true
  exit 2
fi

Rscript task.R
