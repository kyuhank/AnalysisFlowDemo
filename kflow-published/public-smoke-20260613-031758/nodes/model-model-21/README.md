# Model 21: model-21

- Task: `Model`
- Job id: `e74a7dfcf3a7`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 21 in bundle B.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle B](nodes/plot-plot-b-15/)
  - [Plot: Plot demo default](nodes/plot-job-11/)
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
INTERCEPT=1.80
JOB_DESCRIPTION=Fits sensitivity model 21 in bundle B.
JOB_KEY=model-21
JOB_TITLE=Model 21: model-21
MODEL_INDEX=21
MODEL_SET=B
NOISE_SD=0.65
N_POINTS=60
RUN_LABEL=model-21
SCENARIO_NOTE=Sensitivity model 21 in bundle B.
SEED=2021
SLOPE=0.92
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-fit.rds](model-fit.rds) | 5721 | `81e1fb2ca6b0bea2` |
| [model-summary.html](model-summary.html) | 192 | `15ae035c05ad82d3` |
| [model-coefficients.csv](model-coefficients.csv) | 181 | `dcee22783dddef2d` |
| [model-data.csv](model-data.csv) | 4846 | `1c09facc4b9f6144` |
| [model-summary.csv](model-summary.csv) | 336 | `e542e9b93624b434` |
| [model-summary.txt](model-summary.txt) | 133 | `34dd9d71b8b07a49` |
