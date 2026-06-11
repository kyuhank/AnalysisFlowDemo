# AnalysisFlowDemo

An R-first demo for Kflow and KflowKit.

The full run is:

```text
20 Model jobs  ->  2 Plot jobs  ->  1 Report job
```

Each Model job fits a tiny linear model with different sensitivity settings.
Plot A receives Model 1-10, Plot B receives Model 11-20, and the final Report
receives both Plot outputs and renders one Quarto HTML report.

## Build the Kflow folders

```r
source("../KflowKit/R/kflowkit.R")
source("scripts/build-with-kflowkit.R")
```

This writes:

```text
model/   kflow.yaml, run.sh, task.R, configs/model-01.env ... model-20.env
plot/    kflow.yaml, run.sh, task.R, configs/plot-a.env, plot-b.env
report/  kflow.yaml, run.sh, task.R, configs/combined-report.env
```

## Register the reports

```r
Sys.setenv(KFLOW_URL = "http://127.0.0.1:8089")
Sys.setenv(KFLOW_DEMO_REPO = "kyuhank/AnalysisFlowDemo")

source("../KflowKit/R/kflowkit.R")
source("scripts/register-reports.R")
```

## Launch the grouped run

```r
source("../KflowKit/R/kflowkit.R")
source("scripts/run-demo.R")
```

R sends API calls and then Kflow takes over:

```text
Model 01 ... Model 10  ->  Plot A
Model 11 ... Model 20  ->  Plot B
Plot A + Plot B        ->  Report
```

Plot and Report may appear as `waiting` until their upstream jobs finish. That is
expected: Kflow starts them automatically when the required output archives are
ready.

To keep R open until the final report finishes:

```r
Sys.setenv(KFLOW_DEMO_WAIT = "true")
source("scripts/run-demo.R")
```

## Inspect jobs from R

```r
kflow_jobs("Model")       # report-local Job numbers, titles, keys, statuses
kflow_jobs("Plot")
kflow_jobs("Report")
kflow_jobs("Report", filter = "combined-report")
```

Use readable keys such as `model-01`, `plot-a`, or `combined-report` when you
want to resume a workflow without guessing internal job ids.

## Local smoke test

```r
source("../KflowKit/R/kflowkit.R")
source("scripts/local-test.R")
```

The local test uses the same Docker image and scripts, but runs only a small
two-model smoke path so it is quick.
