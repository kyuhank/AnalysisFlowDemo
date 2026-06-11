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
