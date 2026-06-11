demo_model_configs <- function(batch) {
  rows <- data.frame(
    RUN_LABEL = sprintf("model-%02d", 1:20),
    MODEL_INDEX = as.character(1:20),
    MODEL_SET = rep(c("A", "B"), each = 10),
    N_POINTS = as.character(rep(c(60, 80, 100, 120), length.out = 20)),
    SEED = as.character(2000 + seq_len(20)),
    INTERCEPT = sprintf("%.2f", rep(c(1.8, 2.1, 2.4, 1.5), length.out = 20)),
    SLOPE = sprintf("%.2f", seq(0.42, 0.99, length.out = 20)),
    NOISE_SD = sprintf("%.2f", rep(c(0.65, 0.85, 1.05, 1.25, 1.45), length.out = 20)),
    stringsAsFactors = FALSE
  )
  transform(
    rows,
    FLOW_GROUP = batch,
    JOB_KEY = RUN_LABEL,
    JOB_TITLE = paste0("Model ", MODEL_INDEX, ": ", RUN_LABEL),
    JOB_DESCRIPTION = paste0("Fits sensitivity model ", MODEL_INDEX, " in bundle ", MODEL_SET, "."),
    SCENARIO_NOTE = paste0("Sensitivity model ", MODEL_INDEX, " in bundle ", MODEL_SET, "."),
    TAG_STAGE = "model",
    TAG_MODEL_SET = MODEL_SET,
    META_FLOW_GROUP = batch,
    META_RUN_LABEL = RUN_LABEL,
    META_MODEL_SET = MODEL_SET,
    META_MODEL_INDEX = MODEL_INDEX
  )
}

demo_plot_configs <- function(batch) {
  rows <- data.frame(
    RUN_LABEL = c("plot-a", "plot-b"),
    MODEL_SET = c("A", "B"),
    PLOT_COLOR = c("#1f6f9f", "#d65f21"),
    PLOT_TITLE = c("Bundle A: first ten model fits", "Bundle B: second ten model fits"),
    SCENARIO_NOTE = c(
      "Summarizes model-01 through model-10.",
      "Summarizes model-11 through model-20."
    ),
    stringsAsFactors = FALSE
  )
  transform(
    rows,
    FLOW_GROUP = batch,
    JOB_KEY = RUN_LABEL,
    JOB_TITLE = paste0("Plot bundle ", MODEL_SET),
    JOB_DESCRIPTION = paste0("Draws one sensitivity plot from ten Model jobs in bundle ", MODEL_SET, "."),
    TAG_STAGE = "plot",
    TAG_MODEL_SET = MODEL_SET,
    META_FLOW_GROUP = batch,
    META_RUN_LABEL = RUN_LABEL,
    META_MODEL_SET = MODEL_SET
  )
}

demo_report_config <- function(batch) {
  kflow_job_config(
    RUN_LABEL = "combined-report",
    FLOW_GROUP = batch,
    REPORT_TITLE = paste0("Linear model sensitivity report (", batch, ")"),
    REPORT_TONE = "detailed",
    SCENARIO_NOTE = "Combines Plot A and Plot B into one Quarto report.",
    JOB_KEY = "combined-report",
    JOB_TITLE = "Report: combined model plots",
    JOB_DESCRIPTION = "Renders one report from the two Plot jobs.",
    TAG_STAGE = "report",
    META_FLOW_GROUP = batch,
    META_RUN_LABEL = "combined-report"
  )
}
