source(Sys.getenv("KFLOWKIT_R", "../KflowKit/scripts/source-local.R"))
source("scripts/job-configs.R")

copy_outputs <- function(outputs, to) {
  if (dir.exists(to)) {
    unlink(to, recursive = TRUE)
  }
  dir.create(to, recursive = TRUE, showWarnings = FALSE)
  file.copy(list.files(outputs, full.names = TRUE), to, recursive = TRUE)
}

message("Local smoke test: two Model jobs -> one Plot -> one Report.")
message("The configs are R objects, not committed model-01.env files.")

batch <- "local-smoke"
models <- demo_model_configs(batch)[1:2, , drop = FALSE]
plots <- demo_plot_configs(batch)[1, , drop = FALSE]
report_config <- demo_report_configs(batch)[1, , drop = FALSE]

model_01 <- kflow_local_test(
  "model",
  env = models[1, , drop = FALSE],
  output_dir = ".kflow-local/output-model-01"
)
model_02 <- kflow_local_test(
  "model",
  env = models[2, , drop = FALSE],
  output_dir = ".kflow-local/output-model-02"
)

copy_outputs(model_01$output_dir, file.path("plot", ".kflow-local", "inputs", "model-01"))
copy_outputs(model_02$output_dir, file.path("plot", ".kflow-local", "inputs", "model-02"))

plot_a <- kflow_local_test(
  "plot",
  env = plots,
  clean = TRUE
)

copy_outputs(plot_a$output_dir, file.path("report", ".kflow-local", "inputs", "plot-a"))

report <- kflow_local_test(
  "report",
  env = report_config,
  clean = TRUE
)

print(report$outputs)
