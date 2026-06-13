# Model 19: model-19

- Task: `Model`
- Job id: `ca24e21f8d24`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 19 in bundle B.

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
INTERCEPT=1.50
JOB_DESCRIPTION=Fits sensitivity model 19 in bundle B.
JOB_KEY=model-19
JOB_TITLE=Model 19: model-19
MODEL_INDEX=19
MODEL_SET=B
NOISE_SD=1.25
N_POINTS=120
RUN_LABEL=model-19
SCENARIO_NOTE=Sensitivity model 19 in bundle B.
SEED=2019
SLOPE=0.87
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031531/kflow-flow-da59c4949540-public-smoke-20260613-031531-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.csv](model-summary.csv) | 340 | `3c4f1d7eaa58411f` |
| [model-fit.rds](model-fit.rds) | 10081 | `8a2f6b3fb4a91d66` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `761da08d7a117450` |
| [model-data.csv](model-data.csv) | 9578 | `0038ef9aabbab569` |
| [model-summary.txt](model-summary.txt) | 134 | `482ebb3bdecfeaa7` |
| [model-summary.html](model-summary.html) | 192 | `93d6c3210941482d` |
