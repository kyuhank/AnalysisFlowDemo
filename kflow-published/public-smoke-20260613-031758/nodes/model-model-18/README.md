# Model 18: model-18

- Task: `Model`
- Job id: `9433aca821e7`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 18 in bundle B.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle B](nodes/plot-plot-b-15/)
  - [Plot: Plot demo default](nodes/plot-job-8/)

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
JOB_DESCRIPTION=Fits sensitivity model 18 in bundle B.
JOB_KEY=model-18
JOB_TITLE=Model 18: model-18
MODEL_INDEX=18
MODEL_SET=B
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-18
SCENARIO_NOTE=Sensitivity model 18 in bundle B.
SEED=2018
SLOPE=0.85
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `a9fcecca0ccebe0b` |
| [model-data.csv](model-data.csv) | 8018 | `8485b2c6ea708b29` |
| [model-summary.txt](model-summary.txt) | 134 | `ed93dabbdb598eb7` |
| [model-summary.html](model-summary.html) | 192 | `256ac7d61cec348a` |
| [model-fit.rds](model-fit.rds) | 8638 | `2a34625b8518ee42` |
| [model-summary.csv](model-summary.csv) | 339 | `ce1fc58db9ef2970` |
