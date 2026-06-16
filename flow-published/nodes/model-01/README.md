# Model 1: model-01

- Task: `Model`
- Job id: `2bc98a4e30d8`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 1 in bundle A.

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
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.csv](model-summary.csv) | 334 | `a0154cb3061839c8` |
| [model-fit.rds](model-fit.rds) | 5690 | `ceb9e0d9bdc06b6c` |
| [model-summary.txt](model-summary.txt) | 132 | `c9022c66414f5773` |
| [model-data.csv](model-data.csv) | 4589 | `b77c708613296017` |
| [model-coefficients.csv](model-coefficients.csv) | 180 | `2e1c819d031e313f` |
| [model-summary.html](model-summary.html) | 191 | `1c90b0c95dce1d55` |
