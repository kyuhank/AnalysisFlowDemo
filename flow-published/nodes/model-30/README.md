# Model 30: model-30

- Task: `Model`
- Job id: `b0f81e29867b`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 30 in bundle C.

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
INTERCEPT=2.70
JOB_DESCRIPTION=Fits sensitivity model 30 in bundle C.
JOB_KEY=model-30
JOB_TITLE=Model 30: model-30
MODEL_INDEX=30
MODEL_SET=C
NOISE_SD=1.45
N_POINTS=140
RUN_LABEL=model-30
SCENARIO_NOTE=Sensitivity model 30 in bundle C.
SEED=2030
SLOPE=1.15
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 134 | `fa263bf97f3385ee` |
| [model-data.csv](model-data.csv) | 10820 | `5971b81455a6158d` |
| [model-summary.html](model-summary.html) | 192 | `22fb5131984fbe09` |
| [model-summary.csv](model-summary.csv) | 337 | `1d86ddf1b971087b` |
| [model-coefficients.csv](model-coefficients.csv) | 184 | `8f582aa62e665e28` |
| [model-fit.rds](model-fit.rds) | 11523 | `a33a1a14e67b812a` |
