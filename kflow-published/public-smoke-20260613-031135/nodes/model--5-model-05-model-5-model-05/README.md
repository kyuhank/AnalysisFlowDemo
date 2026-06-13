# Model 5: model-05

- Task: `Model`
- Job id: `7c69932bcbed`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 5 in bundle A.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle A](nodes/plot--1-plot-a-10-plot-bundle-a/)

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
INTERCEPT=2.70
JOB_DESCRIPTION=Fits sensitivity model 5 in bundle A.
JOB_KEY=model-05
JOB_TITLE=Model 5: model-05
MODEL_INDEX=5
MODEL_SET=A
NOISE_SD=1.45
N_POINTS=140
RUN_LABEL=model-05
SCENARIO_NOTE=Sensitivity model 5 in bundle A.
SEED=2005
SLOPE=0.52
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031135/kflow-flow-da59c4949540-public-smoke-20260613-031135-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-fit.rds](model-fit.rds) | 11545 | `5cb9318bcb5da63a` |
| [model-summary.csv](model-summary.csv) | 338 | `6977a01648f3c26c` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `cc8e4bbb598dca6c` |
| [model-summary.txt](model-summary.txt) | 133 | `26cd925c956328ec` |
| [model-data.csv](model-data.csv) | 11013 | `d9f6bdc54e167cff` |
| [model-summary.html](model-summary.html) | 191 | `5592764dbb2f2389` |
