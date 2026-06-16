# Model 19: model-19

- Task: `Model`
- Job id: `3f9ee8b3d2e6`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 19 in bundle B.

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
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-data.csv](model-data.csv) | 9218 | `0b8905be0eede73a` |
| [model-summary.txt](model-summary.txt) | 134 | `482ebb3bdecfeaa7` |
| [model-fit.rds](model-fit.rds) | 10077 | `3a4442d4d01353b7` |
| [model-summary.html](model-summary.html) | 192 | `93d6c3210941482d` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `761da08d7a117450` |
| [model-summary.csv](model-summary.csv) | 337 | `1692481cc16b5d67` |
