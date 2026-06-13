# Plot demo default

- Task: `Plot`
- Job id: `e836d88acd89`
- Status: `completed`
- Owner: `kyuhank`

Default plot config; run-demo.R submits Plot A, Plot B, and Plot C from explicit Model job groups.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/9457ea109480fb6c4c64aea203075ef6d72e92df/plot)

## Links

- Requires:
  - [Model: Model 19: model-19](nodes/model--19-model-19-model-19-model-19/)
  - [Model: Model 21: model-21](nodes/model--21-model-21-model-21-model-21/)
  - [Model: Model 18: model-18](nodes/model--18-model-18-model-18-model-18/)
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
| [model-sensitivity-plot.svg](model-sensitivity-plot.svg) | 142732 | `7f5ee6fcfed5c3ed` |
| [plot-summary.csv](plot-summary.csv) | 257 | `1b9eb058b2258e89` |
| [plot-model-summaries.csv](plot-model-summaries.csv) | 629 | `38263c8bd1fd9084` |
| [plot-summary.html](plot-summary.html) | 166 | `22968d09dd39c828` |
| [plot-summary.txt](plot-summary.txt) | 112 | `4859f2e8e5daa026` |
| [plot-model-coefficients.csv](plot-model-coefficients.csv) | 418 | `008a3710335e67ba` |
