# AnalysisFlowDemo

An R-first Kflow demo.

R creates the workflow files, sends API requests to Kflow, then stops. Kflow
keeps the job graph, submits HTCondor work on the submitter, saves selected
outputs, and starts waiting jobs when upstream outputs are ready.

```text
20 Model jobs -> 2 Plot jobs -> 1 Report job
```

- Each Model job fits one tiny linear model.
- Plot A reads Model 1-10; Plot B reads Model 11-20.
- Report reads both Plot outputs and renders one HTML report.

## 0. Connect R to Kflow

```r
Sys.setenv(
  KFLOW_URL = "http://127.0.0.1:8089",
  KFLOW_API_TOKEN = "<copy from Kflow>",
  KFLOW_DEMO_REPO = "kyuhank/AnalysisFlowDemo"
)
```

For local package development, point R at the local KflowKit checkout:

```r
Sys.setenv(KFLOWKIT_R = "../KflowKit/R/kflowkit.R")
```

## 1. Build Kflow files from R

```r
source("scripts/01-build-kflow-files.R")
```

KflowKit writes the files that Kflow needs:

```text
model/   kflow.yaml  run.sh  Makefile  configs/model-01.env ... model-20.env
plot/    kflow.yaml  run.sh  Makefile  configs/plot-a.env, plot-b.env
report/  kflow.yaml  run.sh  Makefile  configs/combined-report.env
```

Commit and push after this step, because Kflow runs from GitHub.

## 2. Register the folders as Kflow reports

```r
source("scripts/02-register-kflow-reports.R")
```

This sends:

```text
POST /api/report/Model
POST /api/report/Plot
POST /api/report/Report
```

Kflow reads each folder's `kflow.yaml`: Docker image, command, saved outputs,
job config schema, and dependency settings.

## 3. Launch through the Kflow API

Preview the API plan without creating jobs:

```r
Sys.setenv(KFLOW_DEMO_DRY_RUN = "true")
source("scripts/03-launch-via-kflow-api.R")
```

Create the jobs:

```r
Sys.setenv(KFLOW_DEMO_DRY_RUN = "false")
source("scripts/03-launch-via-kflow-api.R")
```

The console prints each API submit:

```text
POST /api/job/Model   config model/configs/model-01.env   upstream none
POST /api/job/Plot    config plot/configs/plot-a.env      upstream 10 Model jobs
POST /api/job/Report  config report/configs/combined-report.env upstream 2 Plot jobs
```

After those API calls return, R does not need to keep running. Kflow owns the
waiting links.

## Inspect jobs from R

```r
source("../KflowKit/R/kflowkit.R")

kflow_jobs("Model")   # report-local Job numbers, keys, titles, descriptions
kflow_jobs("Plot")
kflow_jobs("Report")
```

Use readable keys such as `model-01`, `plot-a`, or `combined-report` when you
want to link from a finished job without guessing internal ids.

## Local smoke test

```r
source("scripts/local-test.R")
```

This uses the same Docker image and scripts, but runs only a small path locally.
