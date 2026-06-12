source(Sys.getenv("KFLOWKIT_R", "../KflowKit/scripts/source-local.R"))

repo <- Sys.getenv("KFLOW_DEMO_REPO", "kyuhank/AnalysisFlowDemo")
branch <- Sys.getenv("KFLOW_DEMO_BRANCH", "main")

message("Register task folders in Kflow")
message("  Kflow URL    : ", Sys.getenv("KFLOW_URL", "http://127.0.0.1:8089"))
message("  GitHub repo  : ", repo)
message("  Branch       : ", branch)
message("  API endpoint : POST /api/report/{code} (task-compatible API)")
message("")

source("scripts/register-reports.R")
