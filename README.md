# AnalysisFlowDemo

An R-first example for Kflow and KflowKit.

The workflow is intentionally small:

```text
Model  ->  Plot  ->  Report
```

- **Model** creates a numeric table and summary files.
- **Plot** starts after a Model job succeeds and reads that Model output.
- **Report** starts after a Plot job succeeds and renders a small HTML report.

Kflow owns the dependency chain. R only creates the files, registers the reports,
and starts the first jobs.

## 1. Generate the Kflow files

```r
source("../KflowKit/R/kflowkit.R")
source("scripts/build-with-kflowkit.R")
```

This writes the runnable folders:

```text
model/
  kflow.yaml
  run.sh
  task.R
  configs/baseline.env
  configs/sensitivity.env

plot/
  kflow.yaml
  run.sh
  task.R
  configs/baseline-plot.env
  configs/sensitivity-plot.env

report/
  kflow.yaml
  run.sh
  configs/baseline-report.env
  configs/sensitivity-report.env
```

The `kflow.yaml` files describe Docker images, commands, outputs, dependencies,
and automatic follow-up jobs. The `.env` files hold the user-facing job config:
titles, descriptions, labels, plot style, report tone, seeds, and row counts.

## 2. Register the reports in Kflow

Make sure Kflow is running and `KFLOW_API_TOKEN` is set if your Kflow server
requires one.

```r
Sys.setenv(KFLOW_URL = "http://127.0.0.1:8089")
Sys.setenv(KFLOW_DEMO_REPO = "kyuhank/AnalysisFlowDemo")

source("../KflowKit/R/kflowkit.R")
source("scripts/register-reports.R")
```

That creates or updates these Kflow reports:

| Report | Folder | Depends on |
| --- | --- | --- |
| Model | `model` | fresh start |
| Plot | `plot` | Model output |
| Report | `report` | Plot output |

## 3. Start the chain

Start two Model runs with different config values:

```r
source("../KflowKit/R/kflowkit.R")
source("scripts/run-demo.R")
```

Kflow then takes over:

```text
Model baseline      -> Plot baseline      -> Report baseline
Model sensitivity   -> Plot sensitivity   -> Report sensitivity
```

Each downstream job receives the previous job's saved output archive in
`$INPUT_DIR/<previous-job-id>/`.

## 4. Resume from an existing job

If Model already ran, skip it and start Plot from those outputs:

```r
Sys.setenv(MODEL_JOB_IDS = "abc123,def456")
source("scripts/run-demo.R")
```

If Plot already ran, skip straight to Report:

```r
Sys.setenv(PLOT_JOB_IDS = "plotjob1,plotjob2")
source("scripts/run-demo.R")
```

To inspect available jobs from R:

```r
kflow_jobs("Model")
kflow_latest_jobs("Plot", n = 5)
kflow_latest_job_ids("Model", n = 2)
```

The `job` column matches Kflow's per-report numbering: Job 1, Job 2, Job 3, and
so on.

## 5. Test locally with Docker

Before using the submitter, run the same folders locally:

```r
source("../KflowKit/R/kflowkit.R")
source("scripts/local-test.R")
```

The script runs Model, copies its local outputs into Plot's local input folder,
then does the same for Report. It uses the same Docker images and commands that
Kflow reads from each `kflow.yaml`.

## Why this shape works

- The repo stays ordinary GitHub code.
- Config values live in small `.env` files that R can generate safely.
- Kflow shows job titles, descriptions, config values, source commits, logs,
  outputs, and job links.
- A job id is enough to resume later: pass it as an input and Kflow copies that
  job's saved outputs into the next run.
