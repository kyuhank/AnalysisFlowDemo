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
