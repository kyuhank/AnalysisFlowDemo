source(Sys.getenv("KFLOWKIT_R", "../KflowKit/R/kflowkit.R"))

message("Build Kflow files from R")
message("  Rebuilds model/, plot/, and report/ from scratch for a clean demo.")
message("  This script creates the report folders Kflow will read:")
message("  - model/kflow.yaml, model/run.sh, model/Makefile, model/configs/*.env")
message("  - plot/kflow.yaml, plot/run.sh, plot/Makefile, plot/configs/*.env")
message("  - report/kflow.yaml, report/run.sh, report/Makefile, report/configs/*.env")
message("")

source("scripts/build-with-kflowkit.R")

files <- kflow_list_workflow_files(c("model", "plot", "report"))
print(files)

message("")
message("Done. Commit and push these folders before registering or launching through Kflow.")
invisible(files)
