# Model 10: model-10

- Task: `Model`
- Job id: `50b5921faf61`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 10 in bundle A.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/20057f1df3799442821edf9a325c2a94d4b196df/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle A](nodes/plot-a-10/)

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
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.csv](model-summary.csv) | 336 | `99d54f676c8f45f0` |
| [model-fit.rds](model-fit.rds) | 11547 | `52356e52ae5b44b8` |
| [model-summary.txt](model-summary.txt) | 134 | `2aac71309f81e550` |
| [model-data.csv](model-data.csv) | 10727 | `aea66d2209919b93` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `8789997938fa4c84` |
| [model-summary.html](model-summary.html) | 192 | `7c5a2d5dc529d55f` |
