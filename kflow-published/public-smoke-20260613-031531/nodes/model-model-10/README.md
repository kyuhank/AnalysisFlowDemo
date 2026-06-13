# Model 10: model-10

- Task: `Model`
- Job id: `5d991c3f1454`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 10 in bundle A.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle A](nodes/plot-plot-a-10/)

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
JOB_DESCRIPTION=Fits sensitivity model 10 in bundle A.
JOB_KEY=model-10
JOB_TITLE=Model 10: model-10
MODEL_INDEX=10
MODEL_SET=A
NOISE_SD=1.45
N_POINTS=140
RUN_LABEL=model-10
SCENARIO_NOTE=Sensitivity model 10 in bundle A.
SEED=2010
SLOPE=0.65
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031531/kflow-flow-da59c4949540-public-smoke-20260613-031531-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 134 | `2aac71309f81e550` |
| [model-summary.csv](model-summary.csv) | 339 | `b916cb4ae889dc9c` |
| [model-data.csv](model-data.csv) | 11147 | `16f8de4d89060b1c` |
| [model-summary.html](model-summary.html) | 192 | `7c5a2d5dc529d55f` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `8789997938fa4c84` |
| [model-fit.rds](model-fit.rds) | 11579 | `d5e3dfea26df8769` |
