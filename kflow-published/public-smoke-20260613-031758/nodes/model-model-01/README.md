# Model 1: model-01

- Task: `Model`
- Job id: `99a4b1d1cbc3`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 1 in bundle A.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle A](nodes/plot-plot-a-10/)
  - [Plot: Plot demo default](nodes/plot-job-11/)

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
INTERCEPT=1.80
JOB_DESCRIPTION=Fits sensitivity model 1 in bundle A.
JOB_KEY=model-01
JOB_TITLE=Model 1: model-01
MODEL_INDEX=1
MODEL_SET=A
NOISE_SD=0.65
N_POINTS=60
RUN_LABEL=model-01
SCENARIO_NOTE=Sensitivity model 1 in bundle A.
SEED=2001
SLOPE=0.42
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.html](model-summary.html) | 191 | `1c90b0c95dce1d55` |
| [model-fit.rds](model-fit.rds) | 5691 | `f79e3c4afb65ae3a` |
| [model-data.csv](model-data.csv) | 4769 | `13379615079b0639` |
| [model-summary.csv](model-summary.csv) | 337 | `edf08257d7536650` |
| [model-summary.txt](model-summary.txt) | 132 | `c9022c66414f5773` |
| [model-coefficients.csv](model-coefficients.csv) | 180 | `2e1c819d031e313f` |
