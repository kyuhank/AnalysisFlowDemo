# Model 14: model-14

- Task: `Model`
- Job id: `9fcc69998159`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 14 in bundle B.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/20057f1df3799442821edf9a325c2a94d4b196df/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle B](nodes/plot-b-15/)

## Run settings

- Source repository: `kyuhank/AnalysisFlowDemo`
- Source folder: `model`
- Commit: `20057f1df3799442821edf9a325c2a94d4b196df`
- Command: `bash run.sh`
- Make target: `all`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Resources: `CPU 1 · memory 2GB · disk 2GB`

Public job config:

```text
FLOW_GROUP=guide-20260616-0056
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
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 134 | `c88b0f1466bd1e15` |
| [model-data.csv](model-data.csv) | 9199 | `5153e21e2fe9b865` |
| [model-summary.html](model-summary.html) | 192 | `b4180aee4ab776ab` |
| [model-summary.csv](model-summary.csv) | 337 | `cf3536159be3ccee` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `c790696c182da397` |
| [model-fit.rds](model-fit.rds) | 10078 | `3c96eb9f4453c224` |
