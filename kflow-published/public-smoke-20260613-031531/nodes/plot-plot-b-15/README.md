# Plot bundle B

- Task: `Plot`
- Job id: `d84cd7487398`
- Status: `completed`
- Owner: `kyuhank`

Draws one sensitivity plot from 15 Model jobs in bundle B.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/plot)

## Links

- Requires:
  - [Model: Model 11: model-11](nodes/model-model-11/)
  - [Model: Model 12: model-12](nodes/model-model-12/)
  - [Model: Model 13: model-13](nodes/model-model-13/)
  - [Model: Model 14: model-14](nodes/model-model-14/)
  - [Model: Model 15: model-15](nodes/model-model-15/)
  - [Model: Model 16: model-16](nodes/model-model-16/)
  - [Model: Model 17: model-17](nodes/model-model-17/)
  - [Model: Model 25: model-25](nodes/model-model-25/)
  - [Model: Model 22: model-22](nodes/model-model-22/)
  - [Model: Model 19: model-19](nodes/model-model-19/)
  - [Model: Model 21: model-21](nodes/model-model-21/)
  - [Model: Model 18: model-18](nodes/model-model-18/)
  - [Model: Model 23: model-23](nodes/model-model-23/)
  - [Model: Model 24: model-24](nodes/model-model-24/)
  - [Model: Model 20: model-20](nodes/model-model-20/)
- Feeds: none

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
JOB_DESCRIPTION=Draws one sensitivity plot from 15 Model jobs in bundle B.
JOB_KEY=plot-b-15
JOB_TITLE=Plot bundle B
MODEL_COUNT=15
MODEL_SET=B
PLOT_COLOR=#d65f21
PLOT_TITLE=Bundle B: 15 model fits
RUN_LABEL=plot-b-15
SCENARIO_NOTE=Summarizes model-11 through model-25.
TAG_DEMO=analysis-flow
TAG_STAGE=plot
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031531/kflow-flow-da59c4949540-public-smoke-20260613-031531-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [plot-model-summaries.csv](plot-model-summaries.csv) | 2376 | `37f3e0949054da5b` |
| [plot-summary.txt](plot-summary.txt) | 153 | `7b24489d535067ba` |
| [plot-summary.csv](plot-summary.csv) | 312 | `c5254a9db0ba2989` |
| [plot-summary.html](plot-summary.html) | 195 | `9d3ef85f2551df84` |
| [model-sensitivity-plot.svg](model-sensitivity-plot.svg) | 488241 | `37ba6c8f5de78491` |
| [plot-model-coefficients.csv](plot-model-coefficients.csv) | 1841 | `59ded722ca040895` |
