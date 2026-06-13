# Plot bundle C

- Task: `Plot`
- Job id: `70f24287fe5f`
- Status: `completed`
- Owner: `kyuhank`

Draws one sensitivity plot from 5 Model jobs in bundle C.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/plot)

## Links

- Requires:
  - [Model: Model 30: model-30](nodes/model-model-30/)
  - [Model: Model 28: model-28](nodes/model-model-28/)
  - [Model: Model 27: model-27](nodes/model-model-27/)
  - [Model: Model 29: model-29](nodes/model-model-29/)
  - [Model: Model 26: model-26](nodes/model-model-26/)
- Feeds:
  - [Report: Report: bundle C](nodes/report-report-c/)

## Run settings

- Source repository: `kyuhank/AnalysisFlowDemo`
- Source folder: `plot`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Make target: `all`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Resources: `CPU 1 · memory 2GB · disk 2GB`

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
JOB_DESCRIPTION=Draws one sensitivity plot from 5 Model jobs in bundle C.
JOB_KEY=plot-c-5
JOB_TITLE=Plot bundle C
MODEL_COUNT=5
MODEL_SET=C
PLOT_COLOR=#2f8f5f
PLOT_TITLE=Bundle C: 5 model fits
RUN_LABEL=plot-c-5
SCENARIO_NOTE=Summarizes model-26 through model-30.
TAG_DEMO=analysis-flow
TAG_STAGE=plot
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031531/kflow-flow-da59c4949540-public-smoke-20260613-031531-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-sensitivity-plot.svg](model-sensitivity-plot.svg) | 201026 | `7bd458e0c68d5df1` |
| [plot-model-coefficients.csv](plot-model-coefficients.csv) | 660 | `045141256bdec076` |
| [plot-summary.csv](plot-summary.csv) | 310 | `5ee8794bca502ceb` |
| [plot-summary.html](plot-summary.html) | 194 | `260f556ace89db18` |
| [plot-model-summaries.csv](plot-model-summaries.csv) | 922 | `3d79037089281370` |
| [plot-summary.txt](plot-summary.txt) | 151 | `005a426067bf6c96` |
