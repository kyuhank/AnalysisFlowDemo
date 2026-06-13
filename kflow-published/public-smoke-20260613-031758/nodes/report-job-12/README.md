# Combined report default

- Task: `Report`
- Job id: `b53e75e4d0bc`
- Status: `completed`
- Owner: `kyuhank`

Default report config; run-demo.R submits reports after selected Plot jobs.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/9457ea109480fb6c4c64aea203075ef6d72e92df/report)

## Links

- Requires:
  - [Plot: Plot demo default](nodes/plot-job-13/)
- Feeds: none

## Run settings

- Source repository: `kyuhank/AnalysisFlowDemo`
- Source folder: `report`
- Commit: `9457ea109480fb6c4c64aea203075ef6d72e92df`
- Command: `bash run.sh`
- Make target: `all`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Resources: `CPU 1 · memory 2GB · disk 2GB`

Public job config:

```text
FLOW_GROUP=linear-demo
JOB_DESCRIPTION=Default report config; run-demo.R submits reports after selected Plot jobs.
JOB_TITLE=Combined report default
REPORT_TITLE=Linear model sensitivity report
REPORT_TONE=short
RUN_LABEL=report-a-b
SCENARIO_NOTE=Combine selected plot outputs into one report.
TAG_DEMO=analysis-flow
TAG_STAGE=report
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary-combined.csv](model-summary-combined.csv) | 775 | `6a26c1212ad5c74e` |
| [plot-summary-combined.csv](plot-summary-combined.csv) | 260 | `497b8d1d646e22e5` |
| [plot-a.svg](plot-a.svg) | 168349 | `a2ce9e3157ba5802` |
| [analysis-report.qmd](analysis-report.qmd) | 730 | `27da714ff9dba558` |
| [report-summary.txt](report-summary.txt) | 130 | `e965871d7199c9f0` |
| [analysis-report.html](analysis-report.html) | 1424393 | `cd9d72050dcd50e5` |
| [report-summary.csv](report-summary.csv) | 148 | `ae59021ec165516e` |
