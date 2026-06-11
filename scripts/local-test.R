source(Sys.getenv("KFLOWKIT_R", "../KflowKit/R/kflowkit.R"))

copy_outputs <- function(outputs, to) {
  if (dir.exists(to)) {
    unlink(to, recursive = TRUE)
  }
  dir.create(to, recursive = TRUE, showWarnings = FALSE)
  file.copy(list.files(outputs, full.names = TRUE), to, recursive = TRUE)
}

message("Local smoke test: two Model jobs -> one Plot -> one Report.")

model_01 <- kflow_local_test("model", config = "configs/model-01.env")
model_02 <- kflow_local_test("model", config = "configs/model-02.env", clean = FALSE)

copy_outputs(model_01$output_dir, file.path("plot", ".kflow-local", "inputs", "model-01"))
copy_outputs(model_02$output_dir, file.path("plot", ".kflow-local", "inputs", "model-02"))

plot_a <- kflow_local_test("plot", config = "configs/plot-a.env", clean = FALSE)

copy_outputs(plot_a$output_dir, file.path("report", ".kflow-local", "inputs", "plot-a"))
copy_outputs(plot_a$output_dir, file.path("report", ".kflow-local", "inputs", "plot-b"))

report <- kflow_local_test("report", config = "configs/combined-report.env", clean = FALSE)
print(report$outputs)
