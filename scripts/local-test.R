source(Sys.getenv("KFLOWKIT_R", "../KflowKit/R/kflowkit.R"))

copy_inputs <- function(from, to, label) {
  if (dir.exists(to)) {
    unlink(to, recursive = TRUE)
  }
  dir.create(to, recursive = TRUE, showWarnings = FALSE)
  file.copy(list.files(from, full.names = TRUE), to, recursive = TRUE)
  message(sprintf("Copied local %s outputs into %s", label, to))
}

model <- kflow_local_test(
  "model",
  config = "configs/baseline.env"
)

copy_inputs(
  model$output_dir,
  file.path("plot", ".kflow-local", "inputs", "model-local"),
  "Model"
)

plot <- kflow_local_test(
  "plot",
  config = "configs/baseline-plot.env"
)

copy_inputs(
  plot$output_dir,
  file.path("report", ".kflow-local", "inputs", "plot-local"),
  "Plot"
)

report <- kflow_local_test(
  "report",
  config = "configs/baseline-report.env"
)

print(report$outputs)
