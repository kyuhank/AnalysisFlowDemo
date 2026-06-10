source(Sys.getenv("KFLOWKIT_R", "../KflowKit/R/kflowkit.R"))

common_schema <- kflow_env_schema(
  optional = list(
    RUN_LABEL = "demo",
    CONFIG_NOTE = "",
    PLOT_COLOR = "#1f6f9f",
    PLOT_TYPE = "b",
    REPORT_TITLE = "Analysis Report",
    REPORT_TONE = "short"
  ),
  descriptions = list(
    RUN_LABEL = "Short label shown in Kflow and saved outputs.",
    CONFIG_NOTE = "Short note saved with this run.",
    PLOT_COLOR = "Plot colour for the Plot step.",
    PLOT_TYPE = "R plot type, such as b, l, or p.",
    REPORT_TITLE = "Title used by the Report step.",
    REPORT_TONE = "Report style: short or detailed."
  ),
  choices = list(
    PLOT_TYPE = c("b", "l", "p"),
    REPORT_TONE = c("short", "detailed")
  )
)

model_schema <- kflow_env_schema(
  optional = list(
    RUN_LABEL = "baseline",
    N_POINTS = 40,
    SEED = 42,
    CONFIG_NOTE = "default model calculation",
    PLOT_COLOR = "#1f6f9f",
    PLOT_TYPE = "b",
    REPORT_TITLE = "Analysis Report",
    REPORT_TONE = "short"
  ),
  descriptions = list(
    RUN_LABEL = "Short model run label.",
    N_POINTS = "Number of rows to generate.",
    SEED = "Random seed.",
    CONFIG_NOTE = "Short note saved with model outputs.",
    PLOT_COLOR = "Plot colour passed to the Plot report.",
    PLOT_TYPE = "R plot type passed to the Plot report.",
    REPORT_TITLE = "Title passed to the Report report.",
    REPORT_TONE = "Report style passed to the Report report."
  ),
  choices = list(
    PLOT_TYPE = c("b", "l", "p"),
    REPORT_TONE = c("short", "detailed")
  )
)

model_run <- c(
  "#!/usr/bin/env bash",
  "set -euo pipefail",
  "",
  "OUT_DIR=\"${OUTPUT_DIR:-outputs}\"",
  "mkdir -p \"${OUT_DIR}\"",
  "Rscript task.R"
)

model_task <- c(
  "out_dir <- Sys.getenv(\"OUTPUT_DIR\", \"outputs\")",
  "dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)",
  "",
  "label <- Sys.getenv(\"RUN_LABEL\", \"baseline\")",
  "n <- as.integer(Sys.getenv(\"N_POINTS\", \"40\"))",
  "seed <- as.integer(Sys.getenv(\"SEED\", \"42\"))",
  "note <- Sys.getenv(\"CONFIG_NOTE\", \"\")",
  "",
  "set.seed(seed)",
  "x <- seq_len(n)",
  "y <- round(0.7 * x + sin(x / 4) * 4 + rnorm(n, sd = 1.4), 4)",
  "values <- data.frame(run_label = label, x = x, y = y)",
  "summary <- data.frame(",
  "  run_label = label,",
  "  n_points = n,",
  "  seed = seed,",
  "  mean_y = round(mean(y), 4),",
  "  max_y = round(max(y), 4),",
  "  config_note = note",
  ")",
  "",
  "write.csv(values, file.path(out_dir, \"model-values.csv\"), row.names = FALSE)",
  "write.csv(summary, file.path(out_dir, \"model-summary.csv\"), row.names = FALSE)",
  "writeLines(",
  "  c(",
  "    \"Model summary\",",
  "    sprintf(\"Run label: %s\", label),",
  "    sprintf(\"Rows: %s\", n),",
  "    sprintf(\"Mean y: %s\", summary$mean_y),",
  "    sprintf(\"Note: %s\", note)",
  "  ),",
  "  file.path(out_dir, \"model-summary.txt\")",
  ")",
  "writeLines(",
  "  sprintf(",
  "    \"<!doctype html><html><body><h1>Model</h1><p>%s</p><p>Mean y: %s</p></body></html>\",",
  "    label,",
  "    summary$mean_y",
  "  ),",
  "  file.path(out_dir, \"model-summary.html\")",
  ")"
)

plot_run <- c(
  "#!/usr/bin/env bash",
  "set -euo pipefail",
  "",
  "OUT_DIR=\"${OUTPUT_DIR:-outputs}\"",
  "IN_DIR=\"${INPUT_DIR:-inputs}\"",
  "mkdir -p \"${OUT_DIR}\"",
  "",
  "values=\"$(find \"${IN_DIR}\" -type f -name model-values.csv | sort | head -n 1 || true)\"",
  "summary=\"$(find \"${IN_DIR}\" -type f -name model-summary.csv | sort | head -n 1 || true)\"",
  "",
  "if [[ -z \"${values}\" || -z \"${summary}\" ]]; then",
  "  echo \"Model outputs not found under ${IN_DIR}\" >&2",
  "  find \"${IN_DIR}\" -maxdepth 4 -type f -print | sort >&2 || true",
  "  exit 2",
  "fi",
  "",
  "export MODEL_VALUES=\"${values}\"",
  "export MODEL_SUMMARY=\"${summary}\"",
  "Rscript task.R"
)

plot_task <- c(
  "out_dir <- Sys.getenv(\"OUTPUT_DIR\", \"outputs\")",
  "dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)",
  "",
  "values_path <- Sys.getenv(\"MODEL_VALUES\")",
  "summary_path <- Sys.getenv(\"MODEL_SUMMARY\")",
  "label <- Sys.getenv(\"RUN_LABEL\", \"model-plot\")",
  "note <- Sys.getenv(\"CONFIG_NOTE\", \"\")",
  "plot_color <- Sys.getenv(\"PLOT_COLOR\", \"#1f6f9f\")",
  "plot_type <- Sys.getenv(\"PLOT_TYPE\", \"b\")",
  "",
  "values <- read.csv(values_path)",
  "summary <- read.csv(summary_path)",
  "",
  "svg(file.path(out_dir, \"model-plot.svg\"), width = 7, height = 4)",
  "plot(values$x, values$y, type = plot_type, pch = 19, col = plot_color,",
  "     xlab = \"Index\", ylab = \"Model value\", main = paste(\"Model values:\", summary$run_label[1]))",
  "grid()",
  "dev.off()",
  "",
  "plot_summary <- data.frame(",
  "  run_label = label,",
  "  model_run = summary$run_label[1],",
  "  n_points = summary$n_points[1],",
  "  mean_y = summary$mean_y[1],",
  "  plot_file = \"model-plot.svg\",",
  "  plot_color = plot_color,",
  "  plot_type = plot_type,",
  "  config_note = note",
  ")",
  "write.csv(plot_summary, file.path(out_dir, \"plot-summary.csv\"), row.names = FALSE)",
  "writeLines(",
  "  c(",
  "    \"Plot summary\",",
  "    sprintf(\"Model run: %s\", summary$run_label[1]),",
  "    sprintf(\"Input rows: %s\", summary$n_points[1]),",
  "    sprintf(\"Mean y: %s\", summary$mean_y[1]),",
  "    sprintf(\"Plot color: %s\", plot_color),",
  "    sprintf(\"Plot type: %s\", plot_type)",
  "  ),",
  "  file.path(out_dir, \"plot-summary.txt\")",
  ")",
  "writeLines(",
  "  sprintf(",
  "    \"<!doctype html><html><body><h1>Plot</h1><img src='model-plot.svg' style='max-width: 760px; width: 100%%;'><p>Mean y: %s</p></body></html>\",",
  "    summary$mean_y[1]",
  "  ),",
  "  file.path(out_dir, \"plot-summary.html\")",
  ")"
)

report_run <- c(
  "#!/usr/bin/env bash",
  "set -euo pipefail",
  "",
  "OUT_DIR=\"${OUTPUT_DIR:-outputs}\"",
  "IN_DIR=\"${INPUT_DIR:-inputs}\"",
  "mkdir -p \"${OUT_DIR}\"",
  "",
  "plot_svg=\"$(find \"${IN_DIR}\" -type f -name model-plot.svg | sort | head -n 1 || true)\"",
  "plot_summary=\"$(find \"${IN_DIR}\" -type f -name plot-summary.csv | sort | head -n 1 || true)\"",
  "",
  "if [[ -z \"${plot_svg}\" || -z \"${plot_summary}\" ]]; then",
  "  echo \"Plot outputs not found under ${IN_DIR}\" >&2",
  "  find \"${IN_DIR}\" -maxdepth 4 -type f -print | sort >&2 || true",
  "  exit 2",
  "fi",
  "",
  "cp \"${plot_svg}\" \"${OUT_DIR}/model-plot.svg\"",
  "cp \"${plot_summary}\" \"${OUT_DIR}/plot-summary.csv\"",
  "",
  "mean_y=\"$(awk -F, 'NR == 2 {print $4}' \"${plot_summary}\")\"",
  "plot_color=\"$(awk -F, 'NR == 2 {print $6}' \"${plot_summary}\")\"",
  "plot_type=\"$(awk -F, 'NR == 2 {print $7}' \"${plot_summary}\")\"",
  "run_label=\"${RUN_LABEL:-qmd-summary}\"",
  "note=\"${CONFIG_NOTE:-}\"",
  "report_title=\"${REPORT_TITLE:-Analysis Report}\"",
  "report_tone=\"${REPORT_TONE:-short}\"",
  "",
  "cat > \"${OUT_DIR}/analysis-report.qmd\" <<EOF",
  "---",
  "title: \"${report_title}\"",
  "format:",
  "  html:",
  "    toc: false",
  "    embed-resources: true",
  "---",
  "",
  "## Summary",
  "",
  "This report was rendered by the **Report** step after Kflow copied outputs from",
  "the **Plot** step.",
  "",
  "- Run label: ${run_label}",
  "- Mean model value: ${mean_y}",
  "- Plot style: ${plot_type}, ${plot_color}",
  "- Note: ${note}",
  "",
  "$(if [[ \"${report_tone}\" == \"detailed\" ]]; then printf '## Details\\n\\nThis detailed version records the plot styling and the values copied from the upstream Plot job.\\n\\n'; fi)",
  "## Plot",
  "",
  "![](model-plot.svg)",
  "EOF",
  "",
  "if command -v quarto >/dev/null 2>&1; then",
  "  (cd \"${OUT_DIR}\" && quarto render analysis-report.qmd --to html --output analysis-report.html)",
  "else",
  "  cat > \"${OUT_DIR}/analysis-report.html\" <<EOF",
  "<!doctype html>",
  "<html><body>",
  "<h1>${report_title}</h1>",
  "<p>Run label: ${run_label}</p>",
  "<p>Mean model value: ${mean_y}</p>",
  "<p>Plot style: ${plot_type}, ${plot_color}</p>",
  "<p>Note: ${note}</p>",
  "<img src=\"model-plot.svg\" style=\"max-width: 760px; width: 100%;\">",
  "</body></html>",
  "EOF",
  "fi",
  "",
  "printf \"Rendered analysis-report.html from Plot outputs\\n\" > \"${OUT_DIR}/report-summary.txt\""
)

model_to_plot_env <- list(
  RUN_LABEL = "{{ job.config.RUN_LABEL }}",
  CONFIG_NOTE = "Plot from {{ job.config.RUN_LABEL }} model outputs.",
  PLOT_COLOR = "{{ job.config.PLOT_COLOR }}",
  PLOT_TYPE = "{{ job.config.PLOT_TYPE }}",
  REPORT_TITLE = "{{ job.config.REPORT_TITLE }}",
  REPORT_TONE = "{{ job.config.REPORT_TONE }}",
  JOB_TITLE = "Plot: {{ job.config.RUN_LABEL }}",
  JOB_DESCRIPTION = "Draws the {{ job.config.RUN_LABEL }} model output."
)

plot_to_report_env <- list(
  RUN_LABEL = "{{ job.config.RUN_LABEL }}",
  CONFIG_NOTE = "Report from {{ job.config.RUN_LABEL }} plot outputs.",
  PLOT_COLOR = "{{ job.config.PLOT_COLOR }}",
  PLOT_TYPE = "{{ job.config.PLOT_TYPE }}",
  REPORT_TITLE = "{{ job.config.REPORT_TITLE }}",
  REPORT_TONE = "{{ job.config.REPORT_TONE }}",
  JOB_TITLE = "Report: {{ job.config.RUN_LABEL }}",
  JOB_DESCRIPTION = "Renders a small HTML report for {{ job.config.RUN_LABEL }}."
)

steps <- list(
  kflow_step(
    name = "Model",
    path = "model",
    description = "Runs a small calculation and saves model-summary.csv.",
    command = "bash run.sh",
    docker_image = "rocker/r-ver:4.4.2",
    output_patterns = c("*.csv", "*.txt", "*.html"),
    job_config = model_schema,
    config = list(
      RUN_LABEL = "baseline",
      N_POINTS = 40,
      SEED = 42,
      CONFIG_NOTE = "model values for the demo"
    ),
    config_title = "Model baseline",
    config_description = "Creates the numeric table used by Plot.",
    tags = list(stage = "model", demo = "analysis-flow"),
    triggers = list(
      kflow_trigger(
        "Plot",
        input_jobs = list("{{ job.id }}"),
        env = model_to_plot_env,
        tags = list(stage = "plot", demo = "analysis-flow")
      )
    ),
    run = model_run,
    files = list("task.R" = model_task)
  ),
  kflow_step(
    name = "Plot",
    path = "plot",
    description = "Reads Model outputs and draws model-plot.svg.",
    depends_on = "Model",
    command = "bash run.sh",
    docker_image = "rocker/r-ver:4.4.2",
    output_patterns = c("*.svg", "*.csv", "*.txt", "*.html"),
    job_config = common_schema,
    config = list(
      RUN_LABEL = "model-plot",
      CONFIG_NOTE = "plot from model output",
      PLOT_COLOR = "#1f6f9f",
      PLOT_TYPE = "b"
    ),
    config_title = "Plot model output",
    config_description = "Draws a plot from the latest Model output.",
    tags = list(stage = "plot", demo = "analysis-flow"),
    triggers = list(
      kflow_trigger(
        "Report",
        input_jobs = list("{{ job.id }}"),
        env = plot_to_report_env,
        tags = list(stage = "report", demo = "analysis-flow")
      )
    ),
    run = plot_run,
    files = list("task.R" = plot_task)
  ),
  kflow_step(
    name = "Report",
    path = "report",
    description = "Reads Plot outputs and renders a Quarto-style report.",
    depends_on = "Plot",
    command = "bash run.sh",
    docker_image = "ghcr.io/quarto-dev/quarto:1.6.42",
    output_patterns = c("*.html", "*.qmd", "*.svg", "*.txt", "*.csv"),
    job_config = common_schema,
    config = list(
      RUN_LABEL = "qmd-summary",
      CONFIG_NOTE = "report from plot output",
      REPORT_TITLE = "Analysis Report",
      REPORT_TONE = "short"
    ),
    config_title = "Render analysis report",
    config_description = "Renders a small HTML report from Plot outputs.",
    tags = list(stage = "report", demo = "analysis-flow"),
    run = report_run
  )
)

kflow_write_workflow(steps, root = ".", overwrite = TRUE)

model_jobs <- data.frame(
  RUN_LABEL = c("baseline", "sensitivity"),
  N_POINTS = c(40, 80),
  SEED = c(42, 2026),
  CONFIG_NOTE = c(
    "default model values for the demo",
    "more rows and a different seed"
  ),
  PLOT_COLOR = c("#1f6f9f", "#9a5b13"),
  PLOT_TYPE = c("b", "l"),
  REPORT_TITLE = c("Baseline Report", "Sensitivity Report"),
  REPORT_TONE = c("short", "detailed")
)

kflow_write_job_configs(
  model_jobs,
  dir = "model/configs",
  name = "{RUN_LABEL}",
  schema = model_schema,
  title = "Model: {RUN_LABEL}",
  description = "Runs the {RUN_LABEL} calculation with {N_POINTS} rows.",
  tags = c("RUN_LABEL"),
  metadata = c("N_POINTS", "SEED"),
  overwrite = TRUE
)

plot_jobs <- data.frame(
  RUN_LABEL = c("baseline-plot", "sensitivity-plot"),
  PLOT_COLOR = c("#1f6f9f", "#9a5b13"),
  PLOT_TYPE = c("b", "l"),
  CONFIG_NOTE = c(
    "plot from the baseline model",
    "plot from the sensitivity model"
  )
)

kflow_write_job_configs(
  plot_jobs,
  dir = "plot/configs",
  name = "{RUN_LABEL}",
  schema = common_schema,
  title = "Plot: {RUN_LABEL}",
  description = "Draws {RUN_LABEL} from selected Model outputs.",
  tags = c("RUN_LABEL"),
  overwrite = TRUE
)

report_jobs <- data.frame(
  RUN_LABEL = c("baseline-report", "sensitivity-report"),
  REPORT_TITLE = c("Baseline Report", "Sensitivity Report"),
  REPORT_TONE = c("short", "detailed"),
  CONFIG_NOTE = c(
    "report from the baseline plot",
    "report from the sensitivity plot"
  )
)

kflow_write_job_configs(
  report_jobs,
  dir = "report/configs",
  name = "{RUN_LABEL}",
  schema = common_schema,
  title = "Report: {RUN_LABEL}",
  description = "Renders {RUN_LABEL} from selected Plot outputs.",
  tags = c("RUN_LABEL"),
  overwrite = TRUE
)
