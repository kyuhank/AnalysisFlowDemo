# Model 7: model-07

- Task: `Model`
- Job id: `b5765aefd92e`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 7 in bundle A.

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
INTERCEPT=2.10
JOB_DESCRIPTION=Fits sensitivity model 7 in bundle A.
JOB_KEY=model-07
JOB_TITLE=Model 7: model-07
MODEL_INDEX=7
MODEL_SET=A
NOISE_SD=0.85
N_POINTS=80
RUN_LABEL=model-07
SCENARIO_NOTE=Sensitivity model 7 in bundle A.
SEED=2007
SLOPE=0.57
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031135/kflow-flow-da59c4949540-public-smoke-20260613-031135-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `ff387a2ecbb68c4b` |
| [model-summary.html](model-summary.html) | 191 | `5c0d671e7ee664ce` |
| [model-summary.csv](model-summary.csv) | 336 | `851f523db3ade293` |
| [model-fit.rds](model-fit.rds) | 7159 | `8d43fb3c942589d4` |
| [model-summary.txt](model-summary.txt) | 132 | `6f75e421833712dc` |
| [model-data.csv](model-data.csv) | 6330 | `3af203cebbda1daf` |
