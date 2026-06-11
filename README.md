# AnalysisFlowDemo

A small KflowKit demo you can run from R.

R only launches the work through the Kflow API. After the API calls are accepted,
your local R session can stop. Kflow keeps the graph, submits HTCondor work on
Noumea, waits for upstream jobs, copies outputs into later jobs, and stores the
selected outputs.

```text
30 Model jobs
  -> 3 Plot jobs
       A uses 10 models
       B uses 15 models
       C uses 5 models
  -> 2 Report jobs
       Report A+B uses Plot A and Plot B
       Report C uses Plot C
```

## What Runs

`Model`
: Fits one simple linear model and saves data, coefficients, and summaries.

`Plot`
: Reads a bundle of Model outputs from `$INPUT_DIR` and draws one SVG plot.

`Report`
: Reads one or more Plot outputs from `$INPUT_DIR` and renders an HTML report.

## Files Kflow Uses

```text
AnalysisFlowDemo/
  model/
    kflow.yaml
    run.sh
    task.R
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

The `default.env` files are examples and dashboard defaults. The 30 Model
configs are generated in R at launch time, so GitHub does not need
`model-01.env`, `model-02.env`, and so on.

## One-Time R Setup

```r
install.packages("remotes")
remotes::install_github("kyuhank/KflowKit", auth_token = Sys.getenv("GITHUB_PAT"))

Sys.setenv(
  KFLOW_URL = "http://127.0.0.1:8089",
  KFLOW_API_TOKEN = "<copy your token from Kflow>",
  KFLOW_DEMO_REPO = "kyuhank/AnalysisFlowDemo"
)
```

When developing KflowKit locally next to this repo:

```r
Sys.setenv(KFLOWKIT_R = "../KflowKit/R/kflowkit.R")
```

## 1. Build The Repo Files

Run this from the repo root:

```r
source("scripts/01-build-kflow-files.R")
```

KflowKit writes `kflow.yaml`, `run.sh`, `task.R`, `Makefile`, and the default
job config for each runnable folder.

Commit and push after changing these files because Kflow runs the GitHub repo.

## 2. Register Reports In Kflow

```r
source("scripts/02-register-kflow-reports.R")
```

This creates or updates three Kflow reports:

```text
Model   -> folder model/
Plot    -> folder plot/
Report  -> folder report/
```

## 3. Preview The API Launch

```r
Sys.setenv(KFLOW_DEMO_DRY_RUN = "true")
source("scripts/03-launch-via-kflow-api.R")
```

You should see R print the calls it would send:

```text
30 POSTs to /api/job/Model
3 POSTs to /api/job/Plot
2 POSTs to /api/job/Report
```

## 4. Launch On Kflow

```r
Sys.setenv(KFLOW_DEMO_DRY_RUN = "false")
source("scripts/03-launch-via-kflow-api.R")
```

R sends API requests only. Kflow then owns the waiting:

```text
Models 1-10  -> Plot A -> Report A+B
Models 11-25 -> Plot B -> Report A+B
Models 26-30 -> Plot C -> Report C
```

You can close R after the API calls return.

## Inspect From R

```r
library(KflowKit)

kflow_jobs("Model")
kflow_jobs("Plot")
kflow_jobs("Report")
```

Kflow returns report-local job numbers, readable keys, titles, descriptions,
status, submitter, commit, outputs, and links.

## Local Smoke Test

Run a tiny local test before using the submitter:

```r
source("scripts/local-test.R")
```

This uses the same Docker image and commands that Kflow uses.

## Customize It

Edit `scripts/job-configs.R` to change job counts, grouping, titles,
descriptions, and model settings.

Edit the task scripts when the actual work changes:

- `model/task.R`: create Model outputs.
- `plot/task.R`: read Model outputs from `$INPUT_DIR`.
- `report/task.R`: read Plot outputs from `$INPUT_DIR`.

The same pattern works when Model, Plot, and Report live in completely separate
GitHub repos. Kflow links jobs by report code and job id/key, not by folder.
