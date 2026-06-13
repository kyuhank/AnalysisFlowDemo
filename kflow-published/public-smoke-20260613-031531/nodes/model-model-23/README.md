# Model 23: model-23

- Task: `Model`
- Job id: `078fd904c10f`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 23 in bundle B.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle B](nodes/plot-plot-b-15/)

## Run settings

- Source repository: `kyuhank/AnalysisFlowDemo`
- Source folder: `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Make target: `all`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Resources: `CPU 1 · memory 2GB · disk 2GB`

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=2.40
JOB_DESCRIPTION=Fits sensitivity model 23 in bundle B.
JOB_KEY=model-23
JOB_TITLE=Model 23: model-23
MODEL_INDEX=23
MODEL_SET=B
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-23
SCENARIO_NOTE=Sensitivity model 23 in bundle B.
SEED=2023
SLOPE=0.97
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031531/kflow-flow-da59c4949540-public-smoke-20260613-031531-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-fit.rds](model-fit.rds) | 8643 | `e379ae282dc1ff64` |
| [model-summary.txt](model-summary.txt) | 134 | `0fc82553f86796c7` |
| [model-data.csv](model-data.csv) | 8035 | `0267ceb57c88770a` |
| [model-summary.csv](model-summary.csv) | 340 | `14fe17e8252b2955` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `cacd34426b855738` |
| [model-summary.html](model-summary.html) | 192 | `50a9d99f229901f6` |
