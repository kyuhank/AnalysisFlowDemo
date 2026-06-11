demo_env_flag <- function(name, default = FALSE) {
  value <- tolower(Sys.getenv(name, if (isTRUE(default)) "true" else "false"))
  value %in% c("1", "true", "yes", "y", "on")
}

demo_api_url <- function(path, base_url = Sys.getenv("KFLOW_URL", "http://127.0.0.1:8089")) {
  paste0(sub("/+$", "", base_url), path)
}

demo_compact <- function(x, n = 4) {
  x <- as.character(unlist(x, use.names = FALSE))
  x <- x[nzchar(x)]
  if (!length(x)) {
    return("none")
  }
  if (length(x) <= n) {
    return(paste(x, collapse = ", "))
  }
  paste0(paste(utils::head(x, n), collapse = ", "), sprintf(", ... +%s more", length(x) - n))
}

demo_payload_value <- function(payload, key, default = "") {
  if (!is.list(payload$env)) {
    return(default)
  }
  value <- payload$env[[key]]
  if (is.null(value) || !length(value) || !nzchar(as.character(value))) {
    return(default)
  }
  as.character(value)
}

demo_config_name <- function(config) {
  if (is.null(config)) {
    return("none")
  }
  if (is.character(config)) {
    return(paste(config, collapse = ", "))
  }
  env <- tryCatch(kflow_job_config(config), error = function(...) list())
  for (key in c("JOB_KEY", "RUN_LABEL", "JOB_TITLE")) {
    value <- env[[key]]
    if (!is.null(value) && nzchar(as.character(value))) {
      return(paste0("R config: ", value))
    }
  }
  "R config object"
}

demo_print_connection <- function(repo, branch, batch, submitter, dry_run) {
  token_state <- if (nzchar(Sys.getenv("KFLOW_API_TOKEN", ""))) "set" else "missing"
  submitter_state <- if (nzchar(submitter)) submitter else "report default"
  message("")
  message("Kflow API launch")
  message("  R script     : scripts/run-demo.R")
  message("  Kflow API    : ", demo_api_url(""))
  message("  API token    : ", token_state)
  message("  GitHub source: ", repo, "@", branch)
  message("  Submitter    : ", submitter_state)
  message("  Flow group   : ", batch)
  message("  Mode         : ", if (isTRUE(dry_run)) "dry run, no jobs are created" else "submit jobs to Kflow")
  message("")
  message("After each POST succeeds, this R session can stop.")
  message("Kflow keeps the dependency graph and starts waiting jobs when upstream outputs are ready.")
  message("")
}

demo_print_api_call <- function(report_code, config, payload, step, dry_run) {
  input_jobs <- payload$input_jobs %||% list()
  input_count <- length(input_jobs)
  key <- demo_payload_value(payload, "JOB_KEY", demo_payload_value(payload, "RUN_LABEL", ""))
  title <- demo_payload_value(payload, "JOB_TITLE", "")
  message("")
  message("[", step, "] POST ", demo_api_url(sprintf("/api/job/%s", report_code)))
  message("  report       : ", report_code)
  message("  config       : ", demo_config_name(config))
  message("  source       : ", payload$repo %||% "", "@", payload$branch %||% "", " / ", payload$target_folder %||% "repo root")
  message("  upstream jobs: ", if (input_count) paste0(input_count, " (", demo_compact(input_jobs), ")") else "none; starts fresh")
  message("  group        : ", demo_payload_value(payload, "FLOW_GROUP", "none"))
  message("  key          : ", if (nzchar(key)) key else "none")
  message("  title        : ", if (nzchar(title)) title else "from config defaults")
  if (isTRUE(dry_run)) {
    message("  action       : dry run only")
  } else {
    message("  action       : send payload to Kflow; Kflow submits Condor work")
  }
}

demo_job_id_one <- function(result) {
  if (is.list(result) && is.list(result$job) && !is.null(result$job$id)) {
    return(as.character(result$job$id))
  }
  if (is.list(result) && !is.null(result$id)) {
    return(as.character(result$id))
  }
  NA_character_
}

demo_job_ids <- function(results) {
  if (!is.list(results) || (is.list(results) && is.list(results$job))) {
    results <- list(results)
  }
  ids <- vapply(results, demo_job_id_one, character(1))
  ids[!is.na(ids) & nzchar(ids)]
}

demo_submit <- function(config = NULL,
                        report_code,
                        repo,
                        branch,
                        target_folder,
                        checkout = "full",
                        input_jobs = list(),
                        tags = list(),
                        metadata = list(),
                        env = list(),
                        step = report_code,
                        submitter = Sys.getenv("KFLOW_DEMO_SUBMITTER", Sys.getenv("KFLOW_SUBMITTER", "")),
                        dry_id = NULL,
                        dry_run = demo_env_flag("KFLOW_DEMO_DRY_RUN")) {
  payload <- kflow_payload(
    config = config,
    env = env,
    tags = tags,
    metadata = metadata,
    input_jobs = input_jobs,
    repo = repo,
    branch = branch,
    target_folder = target_folder,
    submitter = submitter,
    checkout = checkout
  )
  demo_print_api_call(report_code, config, payload, step, dry_run)
  if (isTRUE(dry_run)) {
    return(list(
      dry_run = TRUE,
      job = list(
        id = dry_id %||% paste("dry", tolower(report_code), gsub("[^A-Za-z0-9_.-]+", "-", demo_config_name(config)), sep = "-"),
        report_code = report_code,
        status = "dry-run",
        payload = payload
      )
    ))
  }
  kflow_start_job(report_code, payload)
}

demo_print_jobs <- function(label, results) {
  ids <- demo_job_ids(results)
  message("")
  message(label, ": ", paste(ids, collapse = ", "))
  items <- if (is.list(results) && is.list(results$job)) list(results) else as.list(results)
  dry <- any(vapply(items, function(x) is.list(x) && isTRUE(x$dry_run), logical(1)))
  if (isTRUE(dry)) {
    message("  dry run: these are readable placeholders, not Kflow jobs.")
  } else if (length(ids)) {
    print(kflow_simplify_jobs(lapply(ids, kflow_job)))
  }
  invisible(ids)
}
