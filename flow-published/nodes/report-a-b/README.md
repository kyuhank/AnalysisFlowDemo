# Report: bundles A+B

- Task: `Report`
- Job id: `b099df90ff0b`
- Status: `completed`
- Owner: `kyuhank`

Renders one report from Plot bundle A and Plot bundle B.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/20057f1df3799442821edf9a325c2a94d4b196df/report)

## Links

- Requires:
  - [Plot: Plot bundle A](nodes/plot-a-10/)
  - [Plot: Plot bundle B](nodes/plot-b-15/)
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
JOB_DESCRIPTION=Renders one report from Plot bundle A and Plot bundle B.
JOB_KEY=report-a-b
JOB_TITLE=Report: bundles A+B
PLOT_SETS=A,B
REPORT_TITLE=Linear model report: bundles A and B (guide-20260616-0056)
REPORT_TONE=detailed
RUN_LABEL=report-a-b
SCENARIO_NOTE=Combines the 10-model and 15-model plot bundles.
TAG_DEMO=analysis-flow
TAG_STAGE=report
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary-combined.csv](model-summary-combined.csv) | 3741 | `03fcb35b7bc946ca` |
| [plot-summary-combined.csv](plot-summary-combined.csv) | 460 | `406ab141bbf08815` |
| [plot-a.svg](plot-a.svg) | 488241 | `37ba6c8f5de78491` |
| [analysis-report.qmd](analysis-report.qmd) | 1024 | `abfb25d9c3f005b8` |
| [report-summary.txt](report-summary.txt) | 131 | `06f006785697e535` |
| [analysis-report.html](analysis-report.html) | 2313689 | `ddc1ef93f00d9fef` |
| [report-summary.csv](report-summary.csv) | 205 | `ddfc6494741baac1` |
| [plot-b.svg](plot-b.svg) | 346389 | `e37518ae17faee38` |
