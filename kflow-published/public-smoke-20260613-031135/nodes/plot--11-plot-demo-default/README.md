# Plot demo default

- Task: `Plot`
- Job id: `068fb58d670c`
- Status: `completed`
- Owner: `kyuhank`

Default plot config; run-demo.R submits Plot A, Plot B, and Plot C from explicit Model job groups.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/9457ea109480fb6c4c64aea203075ef6d72e92df/plot)

## Links

- Requires:
  - [Model: Model 1: model-01](nodes/model--1-model-01-model-1-model-01/)
  - [Model: Model 2: model-02](nodes/model--2-model-02-model-2-model-02/)
  - [Model: Model 22: model-22](nodes/model--22-model-22-model-22-model-22/)
  - [Model: Model 21: model-21](nodes/model--21-model-21-model-21-model-21/)
  - [Model: Model 28: model-28](nodes/model--28-model-28-model-28-model-28/)
- Feeds: none

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
| [model-sensitivity-plot.svg](model-sensitivity-plot.svg) | 171047 | `de4403a55f9d583c` |
| [plot-summary.csv](plot-summary.csv) | 258 | `1c7d17547411b300` |
| [plot-model-summaries.csv](plot-model-summaries.csv) | 915 | `04e088249a1f400d` |
| [plot-summary.html](plot-summary.html) | 166 | `22968d09dd39c828` |
| [plot-summary.txt](plot-summary.txt) | 112 | `897f2e7a5bd2beac` |
| [plot-model-coefficients.csv](plot-model-coefficients.csv) | 655 | `3d085c9e44990dff` |
