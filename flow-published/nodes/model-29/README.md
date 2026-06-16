# Model 29: model-29

- Task: `Model`
- Job id: `0f90ff678020`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 29 in bundle C.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/20057f1df3799442821edf9a325c2a94d4b196df/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle C](nodes/plot-c-5/)

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
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 134 | `b6f1075a76f143ae` |
| [model-data.csv](model-data.csv) | 9276 | `6d2646ba27119713` |
| [model-summary.html](model-summary.html) | 192 | `b5d06d55f5104481` |
| [model-summary.csv](model-summary.csv) | 337 | `3ef111071cf2fa7d` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `5de95b62eb97b105` |
| [model-fit.rds](model-fit.rds) | 10082 | `24c933092010217a` |
