# Model 15: model-15

- Task: `Model`
- Job id: `8af229507a8b`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 15 in bundle B.

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
INTERCEPT=2.70
JOB_DESCRIPTION=Fits sensitivity model 15 in bundle B.
JOB_KEY=model-15
JOB_TITLE=Model 15: model-15
MODEL_INDEX=15
MODEL_SET=B
NOISE_SD=1.45
N_POINTS=140
RUN_LABEL=model-15
SCENARIO_NOTE=Sensitivity model 15 in bundle B.
SEED=2015
SLOPE=0.77
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 134 | `0fedb727d6607ab6` |
| [model-summary.csv](model-summary.csv) | 336 | `433f2e9a461b9fc8` |
| [model-summary.html](model-summary.html) | 192 | `c3a42269be1d292d` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `0254f6e993ae5da3` |
| [model-fit.rds](model-fit.rds) | 11527 | `7395e884bc4c7340` |
| [model-data.csv](model-data.csv) | 10749 | `9e8c11dda13a2290` |
