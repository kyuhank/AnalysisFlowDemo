# Model 29: model-29

- Task: `Model`
- Job id: `cc1d042822b8`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 29 in bundle C.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle C](nodes/plot-plot-c-5/)
  - [Plot: Plot demo default](nodes/plot-job-13/)

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
JOB_DESCRIPTION=Fits sensitivity model 29 in bundle C.
JOB_KEY=model-29
JOB_TITLE=Model 29: model-29
MODEL_INDEX=29
MODEL_SET=C
NOISE_SD=1.25
N_POINTS=120
RUN_LABEL=model-29
SCENARIO_NOTE=Sensitivity model 29 in bundle C.
SEED=2029
SLOPE=1.12
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.csv](model-summary.csv) | 340 | `cede50d83a7a8fc1` |
| [model-fit.rds](model-fit.rds) | 10088 | `87654a7b51bf353a` |
| [model-summary.txt](model-summary.txt) | 134 | `b6f1075a76f143ae` |
| [model-data.csv](model-data.csv) | 9636 | `8643c9784bbfc99d` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `5de95b62eb97b105` |
| [model-summary.html](model-summary.html) | 192 | `b5d06d55f5104481` |
