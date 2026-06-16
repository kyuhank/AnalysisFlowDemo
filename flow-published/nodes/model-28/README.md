# Model 28: model-28

- Task: `Model`
- Job id: `c359211fd907`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 28 in bundle C.

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
INTERCEPT=2.40
JOB_DESCRIPTION=Fits sensitivity model 28 in bundle C.
JOB_KEY=model-28
JOB_TITLE=Model 28: model-28
MODEL_INDEX=28
MODEL_SET=C
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-28
SCENARIO_NOTE=Sensitivity model 28 in bundle C.
SEED=2028
SLOPE=1.10
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 134 | `bf601124b2954daf` |
| [model-summary.csv](model-summary.csv) | 335 | `5edf6f02e3ba39b5` |
| [model-summary.html](model-summary.html) | 192 | `c25a79f11de24538` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `6edb80e57f8dca26` |
| [model-fit.rds](model-fit.rds) | 8634 | `739dd7087e96108b` |
| [model-data.csv](model-data.csv) | 7748 | `a938553d4bb48a4b` |
