source(Sys.getenv("KFLOWKIT_R", "../KflowKit/R/kflowkit.R"))
source("scripts/kflow-api-trace.R")
source("scripts/job-configs.R")

repo <- Sys.getenv("KFLOW_DEMO_REPO", "kyuhank/AnalysisFlowDemo")
branch <- Sys.getenv("KFLOW_DEMO_BRANCH", "main")
batch <- Sys.getenv(
  "KFLOW_DEMO_BATCH",
  paste0("linear-", format(Sys.time(), "%Y%m%d-%H%M%S"))
)
wait_for_report <- identical(tolower(Sys.getenv("KFLOW_DEMO_WAIT", "false")), "true")
dry_run <- demo_env_flag("KFLOW_DEMO_DRY_RUN")

demo_print_connection(repo, branch, batch, dry_run)

model_configs <- demo_model_configs(batch)
plot_configs <- demo_plot_configs(batch)
report_config <- demo_report_config(batch)

message("Step 1: submit 20 independent Model jobs.")
message("The 20 configs are generated in R now; no model-01.env files are committed.")
model_results <- lapply(seq_len(nrow(model_configs)), function(index) {
  demo_submit(
    model_configs[index, , drop = FALSE],
    report_code = "Model",
    repo = repo,
    branch = branch,
    target_folder = "model",
    checkout = "full",
    tags = list(demo = "analysis-flow", batch = batch),
    metadata = list(batch = batch, plan = "20 models -> 2 plots -> 1 report"),
    step = sprintf("Model %02d/20", index),
    dry_id = sprintf("dry-model-%02d", index),
    dry_run = dry_run
  )
})
model_ids <- demo_print_jobs("Model jobs accepted by Kflow", model_results)

if (length(model_ids) != 20L) {
  stop(sprintf("Expected 20 Model jobs, got %s.", length(model_ids)), call. = FALSE)
}

message("")
message("Step 2: submit two Plot jobs.")
message("Plot A waits for Model jobs 1-10; Plot B waits for Model jobs 11-20.")
plot_results <- lapply(seq_len(nrow(plot_configs)), function(index) {
  config <- plot_configs[index, , drop = FALSE]
  set_name <- config$MODEL_SET[[1]]
  model_rows <- model_configs$MODEL_SET == set_name
  demo_submit(
    config,
    report_code = "Plot",
    repo = repo,
    branch = branch,
    target_folder = "plot",
    checkout = "full",
    input_jobs = as.list(model_ids[model_rows]),
    tags = list(demo = "analysis-flow", batch = batch, model_set = set_name),
    metadata = list(batch = batch, model_set = set_name, upstream_count = sum(model_rows)),
    step = sprintf("Plot %s", set_name),
    dry_id = sprintf("dry-plot-%s", tolower(set_name)),
    dry_run = dry_run
  )
})
plot_ids <- demo_print_jobs("Plot jobs accepted by Kflow", plot_results)

message("")
message("Step 3: submit one Report job.")
message("The Report waits for Plot A and Plot B, then renders one HTML report.")
report_result <- demo_submit(
  report_config,
  report_code = "Report",
  repo = repo,
  branch = branch,
  target_folder = "report",
  checkout = "full",
  input_jobs = as.list(plot_ids),
  tags = list(demo = "analysis-flow", batch = batch),
  metadata = list(batch = batch, upstream_count = length(plot_ids)),
  step = "Report",
  dry_id = "dry-report-combined",
  dry_run = dry_run
)
report_id <- demo_print_jobs("Report job accepted by Kflow", report_result)

message("")
message("Kflow now owns the dependencies:")
message("  R has sent the API requests.")
message("  Kflow stores the job graph, submits Condor jobs on Noumea, and saves selected outputs.")
message("  Plot and Report can show as waiting until their required upstream output archives exist.")

if (wait_for_report && !dry_run) {
  message("Waiting for final Report job to finish...")
  print(kflow_wait_jobs(report_id, interval = 15, timeout = 7200))
}

invisible(list(batch = batch, model_ids = model_ids, plot_ids = plot_ids, report_id = report_id))
