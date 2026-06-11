source(Sys.getenv("KFLOWKIT_R", "../KflowKit/R/kflowkit.R"))

clean_text <- function(x) {
  sub("\n$", "", sub("^\n", "", x))
}

clean_lines <- function(x) {
  strsplit(clean_text(x), "\n", fixed = TRUE)[[1]]
}

docker_image <- "ghcr.io/pacificcommunity/bet-2026:v1.9"

unlink(c("model", "plot", "report"), recursive = TRUE, force = TRUE)

model_schema <- kflow_env_schema(
  optional = list(
    RUN_LABEL = "model-01",
    FLOW_GROUP = "linear-demo",
    MODEL_INDEX = "1",
    MODEL_SET = "A",
    N_POINTS = "80",
    SEED = "101",
    INTERCEPT = "2.0",
    SLOPE = "0.7",
    NOISE_SD = "1.0",
    SCENARIO_NOTE = "baseline sensitivity run"
  ),
  descriptions = list(
    RUN_LABEL = "Readable key used later from R, for example model-01.",
    FLOW_GROUP = "Batch label that groups many independent model jobs.",
    MODEL_INDEX = "Human model number inside the batch.",
    MODEL_SET = "Plot bundle: A for the first ten models, B for the second ten.",
    N_POINTS = "Number of simulated rows.",
    SEED = "Random seed for this model job.",
    INTERCEPT = "True intercept used to simulate y.",
    SLOPE = "True slope used to simulate y.",
    NOISE_SD = "Noise standard deviation.",
    SCENARIO_NOTE = "Short note shown in Kflow and saved outputs."
  )
)

plot_schema <- kflow_env_schema(
  optional = list(
    RUN_LABEL = "plot-a",
    FLOW_GROUP = "linear-demo",
    MODEL_SET = "A",
    PLOT_COLOR = "#1f6f9f",
    PLOT_TITLE = "Model set A sensitivity results",
    SCENARIO_NOTE = "Plot the first ten model outputs."
  ),
  descriptions = list(
    RUN_LABEL = "Readable key used later from R, for example plot-a.",
    FLOW_GROUP = "Batch label shared with the model jobs.",
    MODEL_SET = "Which ten-model bundle this plot summarizes.",
    PLOT_COLOR = "Main colour used by the plot.",
    PLOT_TITLE = "Plot title.",
    SCENARIO_NOTE = "Short note shown in Kflow and saved outputs."
  )
)

report_schema <- kflow_env_schema(
  optional = list(
    RUN_LABEL = "combined-report",
    FLOW_GROUP = "linear-demo",
    REPORT_TITLE = "Linear model sensitivity report",
    REPORT_TONE = "short",
    SCENARIO_NOTE = "Combine both plot outputs into one report."
  ),
  descriptions = list(
    RUN_LABEL = "Readable key used later from R.",
    FLOW_GROUP = "Batch label shared with the plot jobs.",
    REPORT_TITLE = "HTML report title.",
    REPORT_TONE = "short or detailed.",
    SCENARIO_NOTE = "Short note shown in Kflow and saved outputs."
  ),
  choices = list(REPORT_TONE = c("short", "detailed"))
)

model_run <- clean_lines(r"(
#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="${OUTPUT_DIR:-outputs}"
mkdir -p "${OUT_DIR}"
Rscript task.R
)")

model_task <- clean_text(r"(
out_dir <- Sys.getenv("OUTPUT_DIR", "outputs")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

value <- function(name, default) Sys.getenv(name, default)
num <- function(name, default) as.numeric(value(name, default))
int <- function(name, default) as.integer(value(name, default))

label <- value("RUN_LABEL", "model-01")
flow_group <- value("FLOW_GROUP", "linear-demo")
model_index <- int("MODEL_INDEX", "1")
model_set <- value("MODEL_SET", "A")
n_points <- int("N_POINTS", "80")
seed <- int("SEED", "101")
intercept <- num("INTERCEPT", "2.0")
slope <- num("SLOPE", "0.7")
noise_sd <- num("NOISE_SD", "1.0")
note <- value("SCENARIO_NOTE", "")

set.seed(seed)
x <- sort(runif(n_points, min = 0, max = 10))
y <- intercept + slope * x + rnorm(n_points, sd = noise_sd)
fit <- lm(y ~ x)
fit_summary <- summary(fit)

model_data <- data.frame(
  run_label = label,
  flow_group = flow_group,
  model_index = model_index,
  model_set = model_set,
  x = round(x, 6),
  y = round(y, 6),
  fitted = round(fitted(fit), 6),
  residual = round(residuals(fit), 6)
)

coef_table <- as.data.frame(coef(fit_summary))
coef_out <- data.frame(
  run_label = label,
  term = rownames(coef_table),
  estimate = round(coef_table[["Estimate"]], 6),
  std_error = round(coef_table[["Std. Error"]], 6),
  statistic = round(coef_table[["t value"]], 6),
  p_value = signif(coef_table[[4]], 6),
  row.names = NULL
)

model_summary <- data.frame(
  run_label = label,
  flow_group = flow_group,
  model_index = model_index,
  model_set = model_set,
  n_points = n_points,
  seed = seed,
  intercept_true = intercept,
  slope_true = slope,
  noise_sd = noise_sd,
  intercept_estimate = round(unname(coef(fit)[1]), 6),
  slope_estimate = round(unname(coef(fit)[2]), 6),
  r_squared = round(fit_summary$r.squared, 6),
  sigma = round(fit_summary$sigma, 6),
  mean_y = round(mean(y), 6),
  scenario_note = note
)

write.csv(model_data, file.path(out_dir, "model-data.csv"), row.names = FALSE)
write.csv(coef_out, file.path(out_dir, "model-coefficients.csv"), row.names = FALSE)
write.csv(model_summary, file.path(out_dir, "model-summary.csv"), row.names = FALSE)
saveRDS(list(fit = fit, data = model_data, summary = model_summary), file.path(out_dir, "model-fit.rds"))

writeLines(
  c(
    "Model summary",
    sprintf("Run label: %s", label),
    sprintf("Bundle: %s", model_set),
    sprintf("Rows: %s", n_points),
    sprintf("Estimated slope: %.3f", model_summary$slope_estimate),
    sprintf("R-squared: %.3f", model_summary$r_squared),
    sprintf("Note: %s", note)
  ),
  file.path(out_dir, "model-summary.txt")
)

html <- sprintf(
  "<!doctype html><html><body><h1>%s</h1><p>%s</p><table><tr><th>Slope</th><td>%.3f</td></tr><tr><th>R-squared</th><td>%.3f</td></tr></table></body></html>",
  label,
  note,
  model_summary$slope_estimate,
  model_summary$r_squared
)
writeLines(html, file.path(out_dir, "model-summary.html"))
)")

plot_run <- c(
  "#!/usr/bin/env bash",
  "set -euo pipefail",
  "",
  "OUT_DIR=\"${OUTPUT_DIR:-outputs}\"",
  "IN_DIR=\"${INPUT_DIR:-inputs}\"",
  "mkdir -p \"${OUT_DIR}\"",
  "",
  "summary_count=\"$(find \"${IN_DIR}\" -type f -name model-summary.csv | wc -l | tr -d ' ')\"",
  "if [[ \"${summary_count}\" -lt 1 ]]; then",
  "  echo \"No Model outputs found under ${IN_DIR}\" >&2",
  "  find \"${IN_DIR}\" -maxdepth 5 -type f -print | sort >&2 || true",
  "  exit 2",
  "fi",
  "",
  "Rscript task.R"
)

plot_task <- clean_text(r"(
out_dir <- Sys.getenv("OUTPUT_DIR", "outputs")
input_dir <- Sys.getenv("INPUT_DIR", "inputs")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

value <- function(name, default) Sys.getenv(name, default)
label <- value("RUN_LABEL", "plot-a")
flow_group <- value("FLOW_GROUP", "linear-demo")
model_set <- value("MODEL_SET", "A")
plot_color <- value("PLOT_COLOR", "#1f6f9f")
plot_title <- value("PLOT_TITLE", sprintf("Model set %s sensitivity results", model_set))
note <- value("SCENARIO_NOTE", "")

summary_files <- sort(list.files(input_dir, pattern = "^model-summary[.]csv$", recursive = TRUE, full.names = TRUE))
data_files <- sort(list.files(input_dir, pattern = "^model-data[.]csv$", recursive = TRUE, full.names = TRUE))
coef_files <- sort(list.files(input_dir, pattern = "^model-coefficients[.]csv$", recursive = TRUE, full.names = TRUE))

if (!length(summary_files)) {
  stop(sprintf("No model-summary.csv files found under %s", input_dir), call. = FALSE)
}

model_summaries <- do.call(rbind, lapply(summary_files, read.csv))
model_data <- if (length(data_files)) do.call(rbind, lapply(data_files, read.csv)) else data.frame()
model_coefs <- if (length(coef_files)) do.call(rbind, lapply(coef_files, read.csv)) else data.frame()

model_summaries <- model_summaries[order(model_summaries$model_index), ]
if (nrow(model_data)) {
  model_data <- model_data[order(model_data$model_index, model_data$x), ]
}

plot_file <- "model-sensitivity-plot.svg"
svg(file.path(out_dir, plot_file), width = 10, height = 5.6)
layout(matrix(c(1, 2), nrow = 1), widths = c(1.15, 1))

plot(
  model_summaries$model_index,
  model_summaries$slope_estimate,
  type = "b",
  pch = 19,
  col = plot_color,
  xlab = "Model number",
  ylab = "Estimated slope",
  main = plot_title
)
abline(h = mean(model_summaries$slope_estimate), col = "#6b7280", lty = 2)
grid(col = "#e5e7eb")

if (nrow(model_data)) {
  idx <- unique(model_data$model_index)
  palette <- grDevices::colorRampPalette(c("#5b8def", "#26a269", "#f59e0b"))(length(idx))
  plot(
    NA,
    xlim = range(model_data$x),
    ylim = range(model_data$y),
    xlab = "x",
    ylab = "y",
    main = "Simulated data by model"
  )
  for (i in seq_along(idx)) {
    rows <- model_data$model_index == idx[i]
    lines(model_data$x[rows], model_data$fitted[rows], col = palette[i], lwd = 1.1)
    points(model_data$x[rows], model_data$y[rows], col = adjustcolor(palette[i], 0.45), pch = 16, cex = 0.45)
  }
  grid(col = "#e5e7eb")
} else {
  plot.new()
  text(0.5, 0.5, "Model data not available")
}
dev.off()

plot_summary <- data.frame(
  run_label = label,
  flow_group = flow_group,
  model_set = model_set,
  n_models = nrow(model_summaries),
  first_model = min(model_summaries$model_index),
  last_model = max(model_summaries$model_index),
  mean_slope = round(mean(model_summaries$slope_estimate), 6),
  min_slope = round(min(model_summaries$slope_estimate), 6),
  max_slope = round(max(model_summaries$slope_estimate), 6),
  mean_r_squared = round(mean(model_summaries$r_squared), 6),
  plot_file = plot_file,
  scenario_note = note
)

write.csv(plot_summary, file.path(out_dir, "plot-summary.csv"), row.names = FALSE)
write.csv(model_summaries, file.path(out_dir, "plot-model-summaries.csv"), row.names = FALSE)
if (nrow(model_coefs)) {
  write.csv(model_coefs, file.path(out_dir, "plot-model-coefficients.csv"), row.names = FALSE)
}

writeLines(
  c(
    "Plot summary",
    sprintf("Run label: %s", label),
    sprintf("Model set: %s", model_set),
    sprintf("Models summarized: %s", nrow(model_summaries)),
    sprintf("Mean slope: %.3f", plot_summary$mean_slope),
    sprintf("Mean R-squared: %.3f", plot_summary$mean_r_squared),
    sprintf("Note: %s", note)
  ),
  file.path(out_dir, "plot-summary.txt")
)

html <- sprintf(
  "<!doctype html><html><body><h1>%s</h1><p>%s</p><img src='%s' style='max-width: 920px; width: 100%%;'></body></html>",
  plot_title,
  note,
  plot_file
)
writeLines(html, file.path(out_dir, "plot-summary.html"))
)")

report_run <- c(
  "#!/usr/bin/env bash",
  "set -euo pipefail",
  "",
  "OUT_DIR=\"${OUTPUT_DIR:-outputs}\"",
  "IN_DIR=\"${INPUT_DIR:-inputs}\"",
  "mkdir -p \"${OUT_DIR}\"",
  "",
  "plot_count=\"$(find \"${IN_DIR}\" -type f -name plot-summary.csv | wc -l | tr -d ' ')\"",
  "if [[ \"${plot_count}\" -lt 1 ]]; then",
  "  echo \"No Plot outputs found under ${IN_DIR}\" >&2",
  "  find \"${IN_DIR}\" -maxdepth 5 -type f -print | sort >&2 || true",
  "  exit 2",
  "fi",
  "",
  "Rscript task.R"
)

report_task <- clean_text(r"(
out_dir <- Sys.getenv("OUTPUT_DIR", "outputs")
input_dir <- Sys.getenv("INPUT_DIR", "inputs")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

value <- function(name, default) Sys.getenv(name, default)
label <- value("RUN_LABEL", "combined-report")
flow_group <- value("FLOW_GROUP", "linear-demo")
report_title <- value("REPORT_TITLE", "Linear model sensitivity report")
report_tone <- value("REPORT_TONE", "short")
note <- value("SCENARIO_NOTE", "")

plot_summary_files <- sort(list.files(input_dir, pattern = "^plot-summary[.]csv$", recursive = TRUE, full.names = TRUE))
plot_model_files <- sort(list.files(input_dir, pattern = "^plot-model-summaries[.]csv$", recursive = TRUE, full.names = TRUE))
plot_svg_files <- sort(list.files(input_dir, pattern = "^model-sensitivity-plot[.]svg$", recursive = TRUE, full.names = TRUE))

if (!length(plot_summary_files)) {
  stop(sprintf("No plot-summary.csv files found under %s", input_dir), call. = FALSE)
}

plot_summaries <- do.call(rbind, lapply(plot_summary_files, read.csv))
model_summaries <- if (length(plot_model_files)) do.call(rbind, lapply(plot_model_files, read.csv)) else data.frame()

if (nrow(plot_summaries)) {
  plot_summaries <- plot_summaries[order(plot_summaries$model_set), ]
}
if (nrow(model_summaries)) {
  model_summaries <- model_summaries[order(model_summaries$model_set, model_summaries$model_index), ]
}

copied_plots <- character()
for (i in seq_along(plot_svg_files)) {
  set_name <- if (i <= nrow(plot_summaries)) tolower(plot_summaries$model_set[i]) else as.character(i)
  target <- sprintf("plot-%s.svg", set_name)
  file.copy(plot_svg_files[i], file.path(out_dir, target), overwrite = TRUE)
  copied_plots <- c(copied_plots, target)
}

write.csv(plot_summaries, file.path(out_dir, "plot-summary-combined.csv"), row.names = FALSE)
if (nrow(model_summaries)) {
  write.csv(model_summaries, file.path(out_dir, "model-summary-combined.csv"), row.names = FALSE)
}

report_summary <- data.frame(
  run_label = label,
  flow_group = flow_group,
  plot_jobs = nrow(plot_summaries),
  model_jobs = if (nrow(model_summaries)) length(unique(model_summaries$run_label)) else NA_integer_,
  mean_slope = if (nrow(model_summaries)) round(mean(model_summaries$slope_estimate), 6) else NA_real_,
  mean_r_squared = if (nrow(model_summaries)) round(mean(model_summaries$r_squared), 6) else NA_real_,
  scenario_note = note
)
write.csv(report_summary, file.path(out_dir, "report-summary.csv"), row.names = FALSE)

plot_rows <- if (nrow(plot_summaries)) {
  paste(
    sprintf(
      "| %s | %s | %.3f | %.3f |",
      plot_summaries$model_set,
      plot_summaries$n_models,
      plot_summaries$mean_slope,
      plot_summaries$mean_r_squared
    ),
    collapse = "\n"
  )
} else {
  "| none | 0 | NA | NA |"
}

plot_sections <- if (length(copied_plots)) {
  paste(
    sprintf("### Plot %s\n\n![](%s)\n", seq_along(copied_plots), copied_plots),
    collapse = "\n"
  )
} else {
  "No SVG plots were copied into the report output."
}

detail_section <- ""
if (identical(report_tone, "detailed") && nrow(model_summaries)) {
  best <- model_summaries[which.max(model_summaries$r_squared), ]
  detail_section <- sprintf(
    "\n## Notes\n\nThe strongest fit in this run was `%s` from set `%s` with R-squared %.3f. The report was built from %s model outputs and %s plot outputs.\n",
    best$run_label,
    best$model_set,
    best$r_squared,
    length(unique(model_summaries$run_label)),
    nrow(plot_summaries)
  )
}

qmd <- paste(
  "---",
  sprintf("title: \"%s\"", report_title),
  "format:",
  "  html:",
  "    toc: true",
  "    embed-resources: true",
  "---",
  "",
  "## Intro",
  "",
  "This demo starts many independent Model jobs, groups them into two Plot jobs, then combines those two Plot outputs into this one report.",
  "",
  sprintf("- Flow group: `%s`", flow_group),
  sprintf("- Report key: `%s`", label),
  sprintf("- Note: %s", note),
  "",
  "## Methods",
  "",
  "Each Model job fits a simple linear model to simulated data. Each Plot job receives ten Model output archives through Kflow's `$INPUT_DIR`. The Report job receives two Plot output archives and renders this HTML file.",
  "",
  "## Plot bundles",
  "",
  "| Bundle | Models | Mean slope | Mean R-squared |",
  "| --- | ---: | ---: | ---: |",
  plot_rows,
  "",
  "## Results",
  "",
  plot_sections,
  detail_section,
  sep = "\n"
)

writeLines(qmd, file.path(out_dir, "analysis-report.qmd"))

if (nzchar(Sys.which("quarto"))) {
  old <- setwd(out_dir)
  on.exit(setwd(old), add = TRUE)
  status <- system2("quarto", c("render", "analysis-report.qmd", "--to", "html", "--output", "analysis-report.html"))
  if (!identical(status, 0L)) {
    stop("quarto render failed", call. = FALSE)
  }
} else {
  html <- paste(
    "<!doctype html><html><body>",
    sprintf("<h1>%s</h1>", report_title),
    "<p>Quarto was not available, so Kflow wrote this fallback HTML.</p>",
    sprintf("<pre>%s</pre>", paste(qmd, collapse = "\n")),
    "</body></html>",
    sep = "\n"
  )
  writeLines(html, file.path(out_dir, "analysis-report.html"))
}

writeLines(
  c(
    "Report summary",
    sprintf("Run label: %s", label),
    sprintf("Plot jobs combined: %s", nrow(plot_summaries)),
    sprintf("Model jobs summarized: %s", report_summary$model_jobs),
    sprintf("Mean slope: %s", report_summary$mean_slope),
    sprintf("Mean R-squared: %s", report_summary$mean_r_squared)
  ),
  file.path(out_dir, "report-summary.txt")
)
)")

steps <- list(
  kflow_step(
    name = "Model",
    path = "model",
    description = "Fits one simple linear model and saves data, coefficients, and summary files.",
    command = "bash run.sh",
    docker_image = docker_image,
    output_patterns = c("*.csv", "*.txt", "*.html", "*.rds"),
    job_config = model_schema,
    tags = list(demo = "analysis-flow", stage = "model"),
    config = list(RUN_LABEL = "model-01", MODEL_INDEX = "1", MODEL_SET = "A"),
    config_title = "Model demo default",
    config_description = "Default model config; generated configs run the full 20-model batch.",
    run = model_run,
    files = list("task.R" = model_task)
  ),
  kflow_step(
    name = "Plot",
    path = "plot",
    description = "Reads ten Model outputs and draws one sensitivity plot.",
    command = "bash run.sh",
    docker_image = docker_image,
    output_patterns = c("*.svg", "*.csv", "*.txt", "*.html"),
    job_config = plot_schema,
    tags = list(demo = "analysis-flow", stage = "plot"),
    config = list(RUN_LABEL = "plot-a", MODEL_SET = "A"),
    config_title = "Plot demo default",
    config_description = "Default plot config; run-demo.R submits Plot A and Plot B from explicit Model job groups.",
    run = plot_run,
    files = list("task.R" = plot_task)
  ),
  kflow_step(
    name = "Report",
    path = "report",
    description = "Combines two Plot outputs and renders one Quarto HTML report.",
    command = "bash run.sh",
    docker_image = docker_image,
    output_patterns = c("*.html", "*.qmd", "*.svg", "*.csv", "*.txt"),
    job_config = report_schema,
    tags = list(demo = "analysis-flow", stage = "report"),
    config = list(RUN_LABEL = "combined-report", REPORT_TONE = "short"),
    config_title = "Combined report default",
    config_description = "Default report config; run-demo.R submits one Report after both Plot jobs.",
    run = report_run,
    files = list("task.R" = report_task)
  )
)

written <- kflow_write_workflow(
  steps,
  auto_dependencies = FALSE,
  auto_triggers = FALSE,
  overwrite = TRUE
)

model_rows <- data.frame(
  RUN_LABEL = sprintf("model-%02d", 1:20),
  FLOW_GROUP = "linear-demo",
  MODEL_INDEX = as.character(1:20),
  MODEL_SET = rep(c("A", "B"), each = 10),
  N_POINTS = as.character(rep(c(60, 80, 100, 120), length.out = 20)),
  SEED = as.character(2000 + seq_len(20)),
  INTERCEPT = sprintf("%.2f", rep(c(1.8, 2.1, 2.4, 1.5), length.out = 20)),
  SLOPE = sprintf("%.2f", seq(0.42, 0.99, length.out = 20)),
  NOISE_SD = sprintf("%.2f", rep(c(0.65, 0.85, 1.05, 1.25, 1.45), length.out = 20)),
  SCENARIO_NOTE = sprintf("Sensitivity model %02d in bundle %s.", 1:20, rep(c("A", "B"), each = 10)),
  STAGE = "model",
  stringsAsFactors = FALSE
)

kflow_write_job_configs(
  model_rows,
  dir = "model/configs",
  name = "{RUN_LABEL}",
  key = "{RUN_LABEL}",
  group = "{FLOW_GROUP}",
  title = "Model {MODEL_INDEX}: {RUN_LABEL}",
  description = "Fits sensitivity model {MODEL_INDEX} in bundle {MODEL_SET}.",
  tags = c("STAGE", "MODEL_SET"),
  metadata = c("FLOW_GROUP", "RUN_LABEL", "MODEL_SET", "MODEL_INDEX"),
  schema = model_schema,
  overwrite = TRUE
)

plot_rows <- data.frame(
  RUN_LABEL = c("plot-a", "plot-b"),
  FLOW_GROUP = "linear-demo",
  MODEL_SET = c("A", "B"),
  PLOT_COLOR = c("#1f6f9f", "#8a4fff"),
  PLOT_TITLE = c("Bundle A: first ten model fits", "Bundle B: second ten model fits"),
  SCENARIO_NOTE = c(
    "Summarizes model-01 through model-10.",
    "Summarizes model-11 through model-20."
  ),
  STAGE = "plot",
  stringsAsFactors = FALSE
)

kflow_write_job_configs(
  plot_rows,
  dir = "plot/configs",
  name = "{RUN_LABEL}",
  key = "{RUN_LABEL}",
  group = "{FLOW_GROUP}",
  title = "Plot bundle {MODEL_SET}",
  description = "Draws one sensitivity plot from ten Model jobs in bundle {MODEL_SET}.",
  tags = c("STAGE", "MODEL_SET"),
  metadata = c("FLOW_GROUP", "RUN_LABEL", "MODEL_SET"),
  schema = plot_schema,
  overwrite = TRUE
)

report_rows <- data.frame(
  RUN_LABEL = "combined-report",
  FLOW_GROUP = "linear-demo",
  REPORT_TITLE = "Linear model sensitivity report",
  REPORT_TONE = "detailed",
  SCENARIO_NOTE = "Combines Plot A and Plot B into one Quarto report.",
  STAGE = "report",
  stringsAsFactors = FALSE
)

kflow_write_job_configs(
  report_rows,
  dir = "report/configs",
  name = "{RUN_LABEL}",
  key = "{RUN_LABEL}",
  group = "{FLOW_GROUP}",
  title = "Report: combined model plots",
  description = "Renders one report from the two Plot jobs.",
  tags = c("STAGE"),
  metadata = c("FLOW_GROUP", "RUN_LABEL"),
  schema = report_schema,
  overwrite = TRUE
)

print(written)
