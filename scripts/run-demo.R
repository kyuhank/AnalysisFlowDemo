source(Sys.getenv("KFLOWKIT_R", "../KflowKit/R/kflowkit.R"))

repo <- Sys.getenv("KFLOW_DEMO_REPO", "kyuhank/AnalysisFlowDemo")
branch <- Sys.getenv("KFLOW_DEMO_BRANCH", "main")
batch <- Sys.getenv(
  "KFLOW_DEMO_BATCH",
  paste0("linear-", format(Sys.time(), "%Y%m%d-%H%M%S"))
)
wait_for_report <- identical(tolower(Sys.getenv("KFLOW_DEMO_WAIT", "false")), "true")

print_jobs <- function(label, results) {
  ids <- kflow_job_ids(results)
  message(label, ": ", paste(ids, collapse = ", "))
  print(kflow_simplify_jobs(lapply(ids, kflow_job)))
  invisible(ids)
}

model_configs <- file.path("model", "configs", sprintf("model-%02d.env", 1:20))

message("Starting 20 independent Model jobs for batch ", batch)
model_results <- kflow_run_many(
  model_configs,
  report_code = "Model",
  repo = repo,
  branch = branch,
  target_folder = "model",
  checkout = "full",
  tags = list(demo = "analysis-flow", batch = batch),
  metadata = list(batch = batch, plan = "20 models -> 2 plots -> 1 report"),
  env = list(FLOW_GROUP = batch)
)
model_ids <- print_jobs("Model jobs", model_results)

if (length(model_ids) != 20L) {
  stop(sprintf("Expected 20 Model jobs, got %s.", length(model_ids)), call. = FALSE)
}

plot_specs <- list(
  A = list(config = "plot/configs/plot-a.env", models = model_ids[1:10]),
  B = list(config = "plot/configs/plot-b.env", models = model_ids[11:20])
)

message("Creating two Plot jobs. Each Plot waits for ten Model outputs.")
plot_results <- lapply(names(plot_specs), function(set_name) {
  spec <- plot_specs[[set_name]]
  kflow_submit(
    spec$config,
    report_code = "Plot",
    repo = repo,
    branch = branch,
    target_folder = "plot",
    checkout = "full",
    input_jobs = as.list(spec$models),
    tags = list(demo = "analysis-flow", batch = batch, model_set = set_name),
    metadata = list(batch = batch, model_set = set_name, upstream_count = length(spec$models)),
    env = list(FLOW_GROUP = batch)
  )
})
plot_ids <- print_jobs("Plot waiting jobs", plot_results)

message("Creating one Report job. It waits for the two Plot outputs.")
report_result <- kflow_submit(
  "report/configs/combined-report.env",
  report_code = "Report",
  repo = repo,
  branch = branch,
  target_folder = "report",
  checkout = "full",
  input_jobs = as.list(plot_ids),
  tags = list(demo = "analysis-flow", batch = batch),
  metadata = list(batch = batch, upstream_count = length(plot_ids)),
  env = list(
    FLOW_GROUP = batch,
    REPORT_TITLE = sprintf("Linear model sensitivity report (%s)", batch)
  )
)
report_id <- print_jobs("Report waiting job", report_result)

message("Kflow now owns the dependencies:")
message("  20 Model jobs run first.")
message("  Plot A waits for Model 1-10; Plot B waits for Model 11-20.")
message("  One Report waits for Plot A and Plot B.")

if (wait_for_report) {
  message("Waiting for final Report job to finish...")
  print(kflow_wait_jobs(report_id, interval = 15, timeout = 7200))
}

invisible(list(batch = batch, model_ids = model_ids, plot_ids = plot_ids, report_id = report_id))
