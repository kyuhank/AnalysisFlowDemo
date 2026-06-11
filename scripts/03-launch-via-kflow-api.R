source(Sys.getenv("KFLOWKIT_R", "../KflowKit/R/kflowkit.R"))

message("Launch the demo through Kflow API")
message("  R only sends API requests. Kflow submits Condor jobs and manages waiting links.")
message("  Set KFLOW_DEMO_DRY_RUN=true to print the API plan without creating jobs.")
message("")

source("scripts/run-demo.R")
