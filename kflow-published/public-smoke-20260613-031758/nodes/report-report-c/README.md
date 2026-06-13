# Report: bundle C

- Task: `Report`
- Job id: `26bb751ab338`
- Status: `completed`
- Owner: `kyuhank`

Renders one report from Plot bundle C.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/report)

## Links

- Requires:
  - [Plot: Plot bundle C](nodes/plot-plot-c-5/)
- Feeds: none

## Run settings

- Source repository: `kyuhank/AnalysisFlowDemo`
- Source folder: `report`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Make target: `all`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Resources: `CPU 1 · memory 2GB · disk 2GB`

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
JOB_DESCRIPTION=Renders one report from Plot bundle C.
JOB_KEY=report-c
JOB_TITLE=Report: bundle C
PLOT_SETS=C
REPORT_TITLE=Linear model report: bundle C (linear-20260611-164809)
REPORT_TONE=short
RUN_LABEL=report-c
SCENARIO_NOTE=Summarizes the 5-model plot bundle.
TAG_DEMO=analysis-flow
TAG_STAGE=report
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [analysis-report.html](analysis-report.html) | 1468052 | `b74e13516d30592f` |
| [report-summary.csv](report-summary.csv) | 192 | `0162545d35fa6f8b` |
| [plot-c.svg](plot-c.svg) | 201026 | `7bd458e0c68d5df1` |
| [model-summary-combined.csv](model-summary-combined.csv) | 922 | `3d79037089281370` |
| [report-summary.txt](report-summary.txt) | 128 | `47c65c5cc636caa9` |
| [plot-summary-combined.csv](plot-summary-combined.csv) | 310 | `5ee8794bca502ceb` |
| [analysis-report.qmd](analysis-report.qmd) | 797 | `27a645f2abacbc6b` |
