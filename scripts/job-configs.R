demo_model_configs <- function(batch) {
  model_index <- seq_len(30)
  model_set <- c(rep("A", 10), rep("B", 15), rep("C", 5))
  rows <- data.frame(
    RUN_LABEL = sprintf("model-%02d", model_index),
    MODEL_INDEX = as.character(model_index),
    MODEL_SET = model_set,
    N_POINTS = as.character(rep(c(60, 80, 100, 120, 140), length.out = length(model_index))),
    SEED = as.character(2000 + model_index),
    INTERCEPT = sprintf("%.2f", rep(c(1.8, 2.1, 2.4, 1.5, 2.7), length.out = length(model_index))),
    SLOPE = sprintf("%.2f", seq(0.42, 1.15, length.out = length(model_index))),
    NOISE_SD = sprintf("%.2f", rep(c(0.65, 0.85, 1.05, 1.25, 1.45), length.out = length(model_index))),
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
    RUN_LABEL = c("plot-a-10", "plot-b-15", "plot-c-5"),
    MODEL_SET = c("A", "B", "C"),
    MODEL_COUNT = c("10", "15", "5"),
    PLOT_COLOR = c("#1f6f9f", "#d65f21", "#2f8f5f"),
    PLOT_TITLE = c(
      "Bundle A: 10 model fits",
      "Bundle B: 15 model fits",
      "Bundle C: 5 model fits"
    ),
    SCENARIO_NOTE = c(
      "Summarizes model-01 through model-10.",
      "Summarizes model-11 through model-25.",
      "Summarizes model-26 through model-30."
    ),
    stringsAsFactors = FALSE
  )
  transform(
    rows,
    FLOW_GROUP = batch,
    JOB_KEY = RUN_LABEL,
    JOB_TITLE = paste0("Plot bundle ", MODEL_SET),
    JOB_DESCRIPTION = paste0("Draws one sensitivity plot from ", MODEL_COUNT, " Model jobs in bundle ", MODEL_SET, "."),
    TAG_STAGE = "plot",
    TAG_MODEL_SET = MODEL_SET,
    META_FLOW_GROUP = batch,
    META_RUN_LABEL = RUN_LABEL,
    META_MODEL_SET = MODEL_SET
  )
}

demo_report_configs <- function(batch) {
  rows <- data.frame(
    RUN_LABEL = c("report-a-b", "report-c"),
    PLOT_SETS = c("A,B", "C"),
    REPORT_TITLE = c(
      paste0("Linear model report: bundles A and B (", batch, ")"),
      paste0("Linear model report: bundle C (", batch, ")")
    ),
    REPORT_TONE = c("detailed", "short"),
    SCENARIO_NOTE = c(
      "Combines the 10-model and 15-model plot bundles.",
      "Summarizes the 5-model plot bundle."
    ),
    JOB_TITLE = c("Report: bundles A+B", "Report: bundle C"),
    JOB_DESCRIPTION = c(
      "Renders one report from Plot bundle A and Plot bundle B.",
      "Renders one report from Plot bundle C."
    ),
    stringsAsFactors = FALSE
  )
  transform(
    rows,
    FLOW_GROUP = batch,
    JOB_KEY = RUN_LABEL,
    TAG_STAGE = "report",
    META_FLOW_GROUP = batch,
    META_RUN_LABEL = RUN_LABEL,
    META_PLOT_SETS = PLOT_SETS
  )
}

demo_report_config <- function(batch) {
  demo_report_configs(batch)[1, , drop = FALSE]
}
