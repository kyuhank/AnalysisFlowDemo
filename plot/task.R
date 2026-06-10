out_dir <- Sys.getenv("OUTPUT_DIR", "outputs")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

values_path <- Sys.getenv("MODEL_VALUES")
summary_path <- Sys.getenv("MODEL_SUMMARY")
label <- Sys.getenv("RUN_LABEL", "model-plot")
note <- Sys.getenv("CONFIG_NOTE", "")
plot_color <- Sys.getenv("PLOT_COLOR", "#1f6f9f")
plot_type <- Sys.getenv("PLOT_TYPE", "b")

values <- read.csv(values_path)
summary <- read.csv(summary_path)

svg(file.path(out_dir, "model-plot.svg"), width = 7, height = 4)
plot(values$x, values$y, type = plot_type, pch = 19, col = plot_color,
     xlab = "Index", ylab = "Model value", main = paste("Model values:", summary$run_label[1]))
grid()
dev.off()

plot_summary <- data.frame(
  run_label = label,
  model_run = summary$run_label[1],
  n_points = summary$n_points[1],
  mean_y = summary$mean_y[1],
  plot_file = "model-plot.svg",
  plot_color = plot_color,
  plot_type = plot_type,
  config_note = note
)
write.csv(plot_summary, file.path(out_dir, "plot-summary.csv"), row.names = FALSE)
writeLines(
  c(
    "Plot summary",
    sprintf("Model run: %s", summary$run_label[1]),
    sprintf("Input rows: %s", summary$n_points[1]),
    sprintf("Mean y: %s", summary$mean_y[1]),
    sprintf("Plot color: %s", plot_color),
    sprintf("Plot type: %s", plot_type)
  ),
  file.path(out_dir, "plot-summary.txt")
)
writeLines(
  sprintf(
    "<!doctype html><html><body><h1>Plot</h1><img src='model-plot.svg' style='max-width: 760px; width: 100%%;'><p>Mean y: %s</p></body></html>",
    summary$mean_y[1]
  ),
  file.path(out_dir, "plot-summary.html")
)
