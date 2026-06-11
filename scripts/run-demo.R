source(Sys.getenv("KFLOWKIT_R", "../KflowKit/R/kflowkit.R"))
source("scripts/kflow-api-trace.R")
source("scripts/job-configs.R")

repo <- Sys.getenv("KFLOW_DEMO_REPO", "kyuhank/AnalysisFlowDemo")
branch <- Sys.getenv("KFLOW_DEMO_BRANCH", "main")
submitter <- Sys.getenv("KFLOW_DEMO_SUBMITTER", Sys.getenv("KFLOW_SUBMITTER", "noumea"))
batch <- Sys.getenv(
  "KFLOW_DEMO_BATCH",
  paste0("linear-", format(Sys.time(), "%Y%m%d-%H%M%S"))
)
wait_for_report <- identical(tolower(Sys.getenv("KFLOW_DEMO_WAIT", "false")), "true")
dry_run <- demo_env_flag("KFLOW_DEMO_DRY_RUN")

demo_print_connection(repo, branch, batch, submitter, dry_run)

model_configs <- demo_model_configs(batch)
plot_configs <- demo_plot_configs(batch)
report_configs <- demo_report_configs(batch)

message("Step 1: submit 30 independent Model jobs.")
message("The 30 configs are generated in R now; no model-01.env files are committed.")
model_results <- lapply(seq_len(nrow(model_configs)), function(index) {
  demo_submit(
    model_configs[index, , drop = FALSE],
    report_code = "Model",
    repo = repo,
    branch = branch,
    target_folder = "model",
    checkout = "full",
    submitter = submitter,
    tags = list(demo = "analysis-flow", batch = batch),
    metadata = list(batch = batch, plan = "30 models -> 3 plots -> 2 reports"),
    step = sprintf("Model %02d/30", index),
    dry_id = sprintf("dry-model-%02d", index),
    dry_run = dry_run
  )
})
model_ids <- demo_print_jobs("Model jobs accepted by Kflow", model_results)

if (length(model_ids) != 30L) {
  stop(sprintf("Expected 30 Model jobs, got %s.", length(model_ids)), call. = FALSE)
}

message("")
message("Step 2: submit three Plot jobs.")
message("Plot A waits for 10 Model jobs; Plot B waits for 15; Plot C waits for 5.")
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
    submitter = submitter,
    input_jobs = as.list(model_ids[model_rows]),
    tags = list(demo = "analysis-flow", batch = batch, model_set = set_name),
    metadata = list(batch = batch, model_set = set_name, upstream_count = sum(model_rows)),
    step = sprintf("Plot %s", set_name),
    dry_id = sprintf("dry-%s", config$RUN_LABEL[[1]]),
    dry_run = dry_run
  )
})
plot_ids <- demo_print_jobs("Plot jobs accepted by Kflow", plot_results)
plot_ids_by_set <- stats::setNames(as.list(plot_ids), plot_configs$MODEL_SET)

message("")
message("Step 3: submit two Report jobs.")
message("Report A+B waits for Plot A and Plot B; Report C waits for Plot C.")
report_results <- lapply(seq_len(nrow(report_configs)), function(index) {
  config <- report_configs[index, , drop = FALSE]
  plot_sets <- strsplit(config$PLOT_SETS[[1]], ",", fixed = TRUE)[[1]]
  plot_sets <- trimws(plot_sets)
  upstream <- plot_ids_by_set[plot_sets]
  if (any(vapply(upstream, is.null, logical(1)))) {
    stop(sprintf("Missing Plot job for report %s.", config$RUN_LABEL[[1]]), call. = FALSE)
  }
  demo_submit(
    config,
    report_code = "Report",
    repo = repo,
    branch = branch,
    target_folder = "report",
    checkout = "full",
    submitter = submitter,
    input_jobs = unname(upstream),
    tags = list(demo = "analysis-flow", batch = batch, plot_sets = paste(plot_sets, collapse = "+")),
    metadata = list(batch = batch, plot_sets = plot_sets, upstream_count = length(upstream)),
    step = sprintf("Report %s", config$RUN_LABEL[[1]]),
    dry_id = sprintf("dry-report-%s", config$RUN_LABEL[[1]]),
    dry_run = dry_run
  )
})
report_ids <- demo_print_jobs("Report jobs accepted by Kflow", report_results)

message("")
message("Kflow now owns the dependencies:")
message("  R has sent the API requests.")
message("  Kflow stores the job graph, submits Condor jobs on the selected submitter, and saves selected outputs.")
message("  Plot and Report can show as waiting until their required upstream output archives exist.")

if (wait_for_report && !dry_run) {
  message("Waiting for final Report jobs to finish...")
  print(kflow_wait_jobs(report_ids, interval = 15, timeout = 7200))
}

invisible(list(batch = batch, model_ids = model_ids, plot_ids = plot_ids, report_ids = report_ids))
