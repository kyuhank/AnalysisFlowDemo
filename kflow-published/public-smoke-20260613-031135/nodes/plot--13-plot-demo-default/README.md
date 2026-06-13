# Plot demo default

- Task: `Plot`
- Job id: `faede46b32e0`
- Status: `completed`
- Owner: `kyuhank`

Default plot config; run-demo.R submits Plot A, Plot B, and Plot C from explicit Model job groups.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/9457ea109480fb6c4c64aea203075ef6d72e92df/plot)

## Links

- Requires:
  - [Model: Model 28: model-28](nodes/model--28-model-28-model-28-model-28/)
  - [Model: Model 27: model-27](nodes/model--27-model-27-model-27-model-27/)
  - [Model: Model 29: model-29](nodes/model--29-model-29-model-29-model-29/)
  - [Model: Model 26: model-26](nodes/model--26-model-26-model-26-model-26/)
- Feeds:
  - [Report: Combined report default](nodes/report--12-combined-report-default/)

## Run settings

- Source repository: `kyuhank/AnalysisFlowDemo`
- Source folder: `plot`
- Commit: `9457ea109480fb6c4c64aea203075ef6d72e92df`
- Command: `bash run.sh`
- Make target: `all`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Resources: `CPU 1 · memory 2GB · disk 2GB`

Public job config:

```text
FLOW_GROUP=linear-demo
JOB_DESCRIPTION=Default plot config; run-demo.R submits Plot A, Plot B, and Plot C from explicit Model job groups.
JOB_TITLE=Plot demo default
MODEL_COUNT=10
MODEL_SET=A
PLOT_COLOR=#1f6f9f
PLOT_TITLE=Model set A sensitivity results
RUN_LABEL=plot-a-10
SCENARIO_NOTE=Plot the first ten model outputs.
TAG_DEMO=analysis-flow
TAG_STAGE=plot
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031135/kflow-flow-da59c4949540-public-smoke-20260613-031135-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-sensitivity-plot.svg](model-sensitivity-plot.svg) | 168349 | `a2ce9e3157ba5802` |
| [plot-summary.csv](plot-summary.csv) | 260 | `8afc41e07288f40e` |
| [plot-model-summaries.csv](plot-model-summaries.csv) | 775 | `6a26c1212ad5c74e` |
| [plot-summary.html](plot-summary.html) | 166 | `22968d09dd39c828` |
| [plot-summary.txt](plot-summary.txt) | 112 | `c511a3b4630f89ad` |
| [plot-model-coefficients.csv](plot-model-coefficients.csv) | 540 | `57bd9f9ae0e5e82e` |
