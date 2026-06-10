out_dir <- Sys.getenv("OUTPUT_DIR", "outputs")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

label <- Sys.getenv("RUN_LABEL", "baseline")
n <- as.integer(Sys.getenv("N_POINTS", "40"))
seed <- as.integer(Sys.getenv("SEED", "42"))
note <- Sys.getenv("CONFIG_NOTE", "")

set.seed(seed)
x <- seq_len(n)
y <- round(0.7 * x + sin(x / 4) * 4 + rnorm(n, sd = 1.4), 4)
values <- data.frame(run_label = label, x = x, y = y)
summary <- data.frame(
  run_label = label,
  n_points = n,
  seed = seed,
  mean_y = round(mean(y), 4),
  max_y = round(max(y), 4),
  config_note = note
)

write.csv(values, file.path(out_dir, "model-values.csv"), row.names = FALSE)
write.csv(summary, file.path(out_dir, "model-summary.csv"), row.names = FALSE)
writeLines(
  c(
    "Model summary",
    sprintf("Run label: %s", label),
    sprintf("Rows: %s", n),
    sprintf("Mean y: %s", summary$mean_y),
    sprintf("Note: %s", note)
  ),
  file.path(out_dir, "model-summary.txt")
)
writeLines(
  sprintf(
    "<!doctype html><html><body><h1>Model</h1><p>%s</p><p>Mean y: %s</p></body></html>",
    label,
    summary$mean_y
  ),
  file.path(out_dir, "model-summary.html")
)
