# Model 14: model-14

- Task: `Model`
- Job id: `832973121d63`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 14 in bundle B.

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
INTERCEPT=1.50
JOB_DESCRIPTION=Fits sensitivity model 14 in bundle B.
JOB_KEY=model-14
JOB_TITLE=Model 14: model-14
MODEL_INDEX=14
MODEL_SET=B
NOISE_SD=1.25
N_POINTS=120
RUN_LABEL=model-14
SCENARIO_NOTE=Sensitivity model 14 in bundle B.
SEED=2014
SLOPE=0.75
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031531/kflow-flow-da59c4949540-public-smoke-20260613-031531-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 134 | `c88b0f1466bd1e15` |
| [model-data.csv](model-data.csv) | 9559 | `90026309356287d3` |
| [model-summary.html](model-summary.html) | 192 | `b4180aee4ab776ab` |
| [model-summary.csv](model-summary.csv) | 340 | `44c6a3ffba25bb31` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `c790696c182da397` |
| [model-fit.rds](model-fit.rds) | 10083 | `c32a9e31f34ce811` |
