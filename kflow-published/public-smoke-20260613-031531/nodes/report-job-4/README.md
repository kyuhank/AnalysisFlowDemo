# Combined report default

- Task: `Report`
- Job id: `85e039af2855`
- Status: `completed`
- Owner: `kyuhank`

Default report config; run-demo.R submits reports after selected Plot jobs.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/9457ea109480fb6c4c64aea203075ef6d72e92df/report)

## Links

- Requires:
  - [Plot: Plot demo default](nodes/plot-job-5/)
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
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031531/kflow-flow-da59c4949540-public-smoke-20260613-031531-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary-combined.csv](model-summary-combined.csv) | 337 | `f8ac37107ad6dc01` |
| [plot-summary-combined.csv](plot-summary-combined.csv) | 258 | `9739e77ed3abdc99` |
| [plot-a.svg](plot-a.svg) | 72694 | `2833aea3445562ec` |
| [analysis-report.qmd](analysis-report.qmd) | 730 | `aadfe212a24cc194` |
| [report-summary.txt](report-summary.txt) | 128 | `4b06e61d9742af66` |
| [analysis-report.html](analysis-report.html) | 1296853 | `8af4ed4ffe04f5f5` |
| [report-summary.csv](report-summary.csv) | 146 | `53e35da8b7cf0f88` |
