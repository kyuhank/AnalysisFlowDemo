# Model 17: model-17

- Task: `Model`
- Job id: `ce8af50d9d8f`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 17 in bundle B.

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
INTERCEPT=2.10
JOB_DESCRIPTION=Fits sensitivity model 17 in bundle B.
JOB_KEY=model-17
JOB_TITLE=Model 17: model-17
MODEL_INDEX=17
MODEL_SET=B
NOISE_SD=0.85
N_POINTS=80
RUN_LABEL=model-17
SCENARIO_NOTE=Sensitivity model 17 in bundle B.
SEED=2017
SLOPE=0.82
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031531/kflow-flow-da59c4949540-public-smoke-20260613-031531-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 133 | `e8e8dd874ef8440c` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `66f45f63a5e3fc9a` |
| [model-fit.rds](model-fit.rds) | 7164 | `7a0f7bb30ce4b6ef` |
| [model-summary.html](model-summary.html) | 192 | `792329f429a91bcb` |
| [model-summary.csv](model-summary.csv) | 338 | `77489483cfb3a50e` |
| [model-data.csv](model-data.csv) | 6407 | `00015df11822dc93` |
