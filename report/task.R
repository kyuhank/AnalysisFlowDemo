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
