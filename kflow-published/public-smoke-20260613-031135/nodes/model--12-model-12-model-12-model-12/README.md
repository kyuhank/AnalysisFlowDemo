# Model 12: model-12

- Task: `Model`
- Job id: `d692749cacd1`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 12 in bundle B.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle B](nodes/plot--2-plot-b-15-plot-bundle-b/)

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
INTERCEPT=2.10
JOB_DESCRIPTION=Fits sensitivity model 12 in bundle B.
JOB_KEY=model-12
JOB_TITLE=Model 12: model-12
MODEL_INDEX=12
MODEL_SET=B
NOISE_SD=0.85
N_POINTS=80
RUN_LABEL=model-12
SCENARIO_NOTE=Sensitivity model 12 in bundle B.
SEED=2012
SLOPE=0.70
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031135/kflow-flow-da59c4949540-public-smoke-20260613-031135-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.csv](model-summary.csv) | 336 | `597a4bdf97919545` |
| [model-fit.rds](model-fit.rds) | 7177 | `b4bfe5f9c561feff` |
| [model-coefficients.csv](model-coefficients.csv) | 181 | `4036f4b94f34cff2` |
| [model-data.csv](model-data.csv) | 6408 | `4d4b8bbd33e3c409` |
| [model-summary.txt](model-summary.txt) | 133 | `69900cd4a2f3bb40` |
| [model-summary.html](model-summary.html) | 192 | `ab2ac201de4e8fa0` |
