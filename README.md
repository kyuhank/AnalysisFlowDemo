# AnalysisFlowDemo

A beginner-friendly Kflow + KflowKit demo.

This repo shows the smallest useful pattern:

```text
20 Model jobs -> 2 Plot jobs -> 1 Report job
```

R starts the work by calling the Kflow API. After the API calls are accepted,
your R session can stop. Kflow keeps the dependency graph, submits HTCondor jobs
on the submitter, copies upstream outputs into later jobs, and saves the final
outputs.

## What this demo does

1. `Model` fits one simple linear model per job.
2. `Plot` reads ten Model outputs and draws one sensitivity plot.
3. `Report` reads the two Plot outputs and renders one HTML report.

The 20 Model settings are created in R at launch time. They are not stored as
`model-01.env`, `model-02.env`, and so on in GitHub.

## The repo structure

```text
AnalysisFlowDemo/
  model/
    kflow.yaml        # tells Kflow how to run Model
    run.sh            # command run inside the container
    task.R            # the actual R model script
    configs/default.env

  plot/
    kflow.yaml
    run.sh
    task.R
    configs/default.env

  report/
    kflow.yaml
    run.sh
    task.R
    configs/default.env

  scripts/
    01-build-kflow-files.R
    02-register-kflow-reports.R
    03-launch-via-kflow-api.R
    job-configs.R
```

`default.env` is only a small local/default example. The real demo variants are
created by `scripts/job-configs.R` and sent to Kflow when jobs are launched.

## One-time setup

Install KflowKit in R:

```r
install.packages("remotes")
remotes::install_github("kyuhank/KflowKit", auth_token = Sys.getenv("GITHUB_PAT"))
```

Tell R where Kflow is:

```r
Sys.setenv(
  KFLOW_URL = "http://127.0.0.1:8089",
  KFLOW_API_TOKEN = "<copy your token from Kflow>",
  KFLOW_DEMO_REPO = "kyuhank/AnalysisFlowDemo"
)
```

For local KflowKit development, use the checkout next to this repo:

```r
Sys.setenv(KFLOWKIT_R = "../KflowKit/R/kflowkit.R")
```

## Step 1. Build the Kflow files

Run this from the repo root:

```r
source("scripts/01-build-kflow-files.R")
```

This writes or refreshes:

- `model/kflow.yaml`, `model/run.sh`, `model/task.R`
- `plot/kflow.yaml`, `plot/run.sh`, `plot/task.R`
- `report/kflow.yaml`, `report/run.sh`, `report/task.R`

Commit and push after changing these files because Kflow runs from GitHub.

## Step 2. Register the reports in Kflow

```r
source("scripts/02-register-kflow-reports.R")
```

This creates or updates three Kflow reports:

```text
Model   -> folder model/
Plot    -> folder plot/
Report  -> folder report/
```

Kflow reads each `kflow.yaml`: Docker image, command, saved outputs, job config
schema, and dependency settings.

## Step 3. Preview the launch

Dry run first. This prints the API plan without creating jobs:

```r
Sys.setenv(KFLOW_DEMO_DRY_RUN = "true")
source("scripts/03-launch-via-kflow-api.R")
```

You should see:

```text
POST /api/job/Model   R config: model-01   upstream none
POST /api/job/Plot    R config: plot-a     upstream 10 Model jobs
POST /api/job/Report  R config: combined-report upstream 2 Plot jobs
```

## Step 4. Launch the demo

```r
Sys.setenv(KFLOW_DEMO_DRY_RUN = "false")
source("scripts/03-launch-via-kflow-api.R")
```

R sends the API requests. Kflow then owns the waiting jobs:

- Plot A waits for Model jobs 1-10.
- Plot B waits for Model jobs 11-20.
- Report waits for Plot A and Plot B.

You can close R after the API calls return.

## Inspect from R

```r
library(KflowKit)

kflow_jobs("Model")
kflow_jobs("Plot")
kflow_jobs("Report")
```

Kflow shows report-local job numbers like `Job 1`, readable keys like
`model-01`, titles, descriptions, status, submitter, commit, logs, outputs, and
links.

## Local smoke test

Run one Model job locally before using the submitter:

```r
source("scripts/local-test.R")
```

This uses the same Docker image and command that Kflow will use.

## Customizing the demo

Edit `scripts/job-configs.R` to change the number of models, the model settings,
job titles, descriptions, and grouping key.

Edit each folder's `task.R` when the actual work changes:

- `model/task.R`: create model outputs.
- `plot/task.R`: read Model outputs from `$INPUT_DIR`.
- `report/task.R`: read Plot outputs from `$INPUT_DIR` and render HTML.

The same Kflow dependency idea also works across completely separate GitHub
repos. Kflow links reports by report code, not by folder location.
