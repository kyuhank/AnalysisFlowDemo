#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="${OUTPUT_DIR:-outputs}"
IN_DIR="${INPUT_DIR:-inputs}"
mkdir -p "${OUT_DIR}"

plot_svg="$(find "${IN_DIR}" -type f -name model-plot.svg | sort | head -n 1 || true)"
plot_summary="$(find "${IN_DIR}" -type f -name plot-summary.csv | sort | head -n 1 || true)"

if [[ -z "${plot_svg}" || -z "${plot_summary}" ]]; then
  echo "Plot outputs not found under ${IN_DIR}" >&2
  find "${IN_DIR}" -maxdepth 4 -type f -print | sort >&2 || true
  exit 2
fi

cp "${plot_svg}" "${OUT_DIR}/model-plot.svg"
cp "${plot_summary}" "${OUT_DIR}/plot-summary.csv"

mean_y="$(awk -F, 'NR == 2 {print $4}' "${plot_summary}")"
plot_color="$(awk -F, 'NR == 2 {print $6}' "${plot_summary}")"
plot_type="$(awk -F, 'NR == 2 {print $7}' "${plot_summary}")"
run_label="${RUN_LABEL:-qmd-summary}"
note="${CONFIG_NOTE:-}"
report_title="${REPORT_TITLE:-Analysis Report}"
report_tone="${REPORT_TONE:-short}"

cat > "${OUT_DIR}/analysis-report.qmd" <<EOF
---
title: "${report_title}"
format:
  html:
    toc: false
    embed-resources: true
---

## Summary

This report was rendered by the **Report** step after Kflow copied outputs from
the **Plot** step.

- Run label: ${run_label}
- Mean model value: ${mean_y}
- Plot style: ${plot_type}, ${plot_color}
- Note: ${note}

$(if [[ "${report_tone}" == "detailed" ]]; then printf '## Details\n\nThis detailed version records the plot styling and the values copied from the upstream Plot job.\n\n'; fi)
## Plot

![](model-plot.svg)
EOF

if command -v quarto >/dev/null 2>&1; then
  (cd "${OUT_DIR}" && quarto render analysis-report.qmd --to html --output analysis-report.html)
else
  cat > "${OUT_DIR}/analysis-report.html" <<EOF
<!doctype html>
<html><body>
<h1>${report_title}</h1>
<p>Run label: ${run_label}</p>
<p>Mean model value: ${mean_y}</p>
<p>Plot style: ${plot_type}, ${plot_color}</p>
<p>Note: ${note}</p>
<img src="model-plot.svg" style="max-width: 760px; width: 100%;">
</body></html>
EOF
fi

printf "Rendered analysis-report.html from Plot outputs\n" > "${OUT_DIR}/report-summary.txt"
