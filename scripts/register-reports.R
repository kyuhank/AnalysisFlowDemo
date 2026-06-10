source(Sys.getenv("KFLOWKIT_R", "../KflowKit/R/kflowkit.R"))

repo <- Sys.getenv("KFLOW_DEMO_REPO", "kyuhank/AnalysisFlowDemo")
branch <- Sys.getenv("KFLOW_DEMO_BRANCH", "main")

registered <- kflow_register_workflow(
  paths = c("model", "plot", "report"),
  codes = c("Model", "Plot", "Report"),
  repo = repo,
  branch = branch,
  target_folders = c("model", "plot", "report")
)

print(registered)
