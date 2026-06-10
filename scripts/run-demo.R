source(Sys.getenv("KFLOWKIT_R", "../KflowKit/R/kflowkit.R"))

repo <- Sys.getenv("KFLOW_DEMO_REPO", "kyuhank/AnalysisFlowDemo")
branch <- Sys.getenv("KFLOW_DEMO_BRANCH", "main")

split_ids <- function(value) {
  if (is.null(value) || !length(value)) {
    value <- ""
  }
  value <- trimws(value)
  if (!nzchar(value)) {
    return(character())
  }
  trimws(unlist(strsplit(value, ",")))
}

paired <- function(values, fallback) {
  values <- values[nzchar(values)]
  if (length(values)) {
    return(values)
  }
  fallback
}

model_ids <- split_ids(Sys.getenv("MODEL_JOB_IDS"))
plot_ids <- split_ids(Sys.getenv("PLOT_JOB_IDS"))

if (length(plot_ids)) {
  message("Starting Report from existing Plot jobs: ", paste(plot_ids, collapse = ", "))
  report_results <- Map(
    function(config, job_id) {
      kflow_submit_after(
        config,
        report_code = "Report",
        after = job_id,
        repo = repo,
        branch = branch,
        target_folder = "report",
        tags = list(demo = "analysis-flow")
      )
    },
    c("report/configs/baseline-report.env", "report/configs/sensitivity-report.env"),
    paired(plot_ids, plot_ids[1])
  )
  print(kflow_simplify_jobs(lapply(kflow_job_ids(report_results), kflow_job)))
} else if (length(model_ids)) {
  message("Starting Plot from existing Model jobs: ", paste(model_ids, collapse = ", "))
  plot_results <- Map(
    function(config, job_id) {
      kflow_submit_after(
        config,
        report_code = "Plot",
        after = job_id,
        repo = repo,
        branch = branch,
        target_folder = "plot",
        tags = list(demo = "analysis-flow")
      )
    },
    c("plot/configs/baseline-plot.env", "plot/configs/sensitivity-plot.env"),
    paired(model_ids, model_ids[1])
  )
  print(kflow_simplify_jobs(lapply(kflow_job_ids(plot_results), kflow_job)))
  message("Kflow will start Report after each Plot job finishes.")
} else {
  message("Starting two Model jobs. Kflow will trigger Plot, then Report, after each job succeeds.")
  model_results <- kflow_run_many(
    c("model/configs/baseline.env", "model/configs/sensitivity.env"),
    report_code = "Model",
    repo = repo,
    branch = branch,
    target_folder = "model",
    tags = list(demo = "analysis-flow")
  )
  print(kflow_simplify_jobs(lapply(kflow_job_ids(model_results), kflow_job)))
}
