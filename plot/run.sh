#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="${OUTPUT_DIR:-outputs}"
IN_DIR="${INPUT_DIR:-inputs}"
mkdir -p "${OUT_DIR}"

values="$(find "${IN_DIR}" -type f -name model-values.csv | sort | head -n 1 || true)"
summary="$(find "${IN_DIR}" -type f -name model-summary.csv | sort | head -n 1 || true)"

if [[ -z "${values}" || -z "${summary}" ]]; then
  echo "Model outputs not found under ${IN_DIR}" >&2
  find "${IN_DIR}" -maxdepth 4 -type f -print | sort >&2 || true
  exit 2
fi

export MODEL_VALUES="${values}"
export MODEL_SUMMARY="${summary}"
Rscript task.R
