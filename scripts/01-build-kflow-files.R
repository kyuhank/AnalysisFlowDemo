source(Sys.getenv("KFLOWKIT_R", "../KflowKit/R/kflowkit.R"))

message("Build Kflow files from R")
message("  Rebuilds model/, plot/, and report/ from scratch for a clean demo.")
message("  This script creates the report folders Kflow will read:")
message("  - model/kflow.yaml, model/run.sh, model/Makefile, model/task.R")
message("  - plot/kflow.yaml, plot/run.sh, plot/Makefile, plot/task.R")
message("  - report/kflow.yaml, report/run.sh, report/Makefile, report/task.R")
message("  - configs/default.env only; run-demo.R creates the real job configs in R")
message("")

source("scripts/build-with-kflowkit.R")

files <- kflow_list_workflow_files(c("model", "plot", "report"))
print(files)

message("")
message("Done. Commit and push these folders before registering or launching through Kflow.")
invisible(files)
