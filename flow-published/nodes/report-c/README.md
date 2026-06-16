# Report: bundle C

- Task: `Report`
- Job id: `2d9d6772da2a`
- Status: `completed`
- Owner: `kyuhank`

Renders one report from Plot bundle C.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/20057f1df3799442821edf9a325c2a94d4b196df/report)

## Links

- Requires:
  - [Plot: Plot bundle C](nodes/plot-c-5/)
- Feeds: none

## Run settings

- Source repository: `kyuhank/AnalysisFlowDemo`
- Source folder: `report`
- Commit: `20057f1df3799442821edf9a325c2a94d4b196df`
- Command: `bash run.sh`
- Make target: `all`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Resources: `CPU 1 · memory 2GB · disk 2GB`

Public job config:

```text
FLOW_GROUP=guide-20260616-0056
JOB_DESCRIPTION=Renders one report from Plot bundle C.
JOB_KEY=report-c
JOB_TITLE=Report: bundle C
PLOT_SETS=C
REPORT_TITLE=Linear model report: bundle C (guide-20260616-0056)
REPORT_TONE=short
RUN_LABEL=report-c
SCENARIO_NOTE=Summarizes the 5-model plot bundle.
TAG_DEMO=analysis-flow
TAG_STAGE=report
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary-combined.csv](model-summary-combined.csv) | 907 | `5ae773fa955f674d` |
| [plot-summary-combined.csv](plot-summary-combined.csv) | 307 | `e8f941c86cfd5a73` |
| [analysis-report.qmd](analysis-report.qmd) | 791 | `f8ff447436744128` |
| [report-summary.txt](report-summary.txt) | 128 | `47c65c5cc636caa9` |
| [analysis-report.html](analysis-report.html) | 1468043 | `8c3cdbed91f5872f` |
| [report-summary.csv](report-summary.csv) | 189 | `f39bbcba99334348` |
| [plot-c.svg](plot-c.svg) | 201026 | `7bd458e0c68d5df1` |
