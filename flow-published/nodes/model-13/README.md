# Model 13: model-13

- Task: `Model`
- Job id: `bc0a0f5e5235`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 13 in bundle B.

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
INTERCEPT=2.40
JOB_DESCRIPTION=Fits sensitivity model 13 in bundle B.
JOB_KEY=model-13
JOB_TITLE=Model 13: model-13
MODEL_INDEX=13
MODEL_SET=B
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-13
SCENARIO_NOTE=Sensitivity model 13 in bundle B.
SEED=2013
SLOPE=0.72
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.csv](model-summary.csv) | 337 | `7dd75f4dd1c369af` |
| [model-summary.txt](model-summary.txt) | 134 | `721d7d1c9571d8c0` |
| [model-fit.rds](model-fit.rds) | 8648 | `565aedfae7de8614` |
| [model-coefficients.csv](model-coefficients.csv) | 184 | `ea6fff756e43468b` |
| [model-summary.html](model-summary.html) | 192 | `3cac6ca887baca3a` |
| [model-data.csv](model-data.csv) | 7683 | `1f00e4b4cf4569bd` |
