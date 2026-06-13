# Model 15: model-15

- Task: `Model`
- Job id: `cd02adf4fb90`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 15 in bundle B.

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
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.csv](model-summary.csv) | 339 | `34d3808217c79af2` |
| [model-fit.rds](model-fit.rds) | 11561 | `01ee08b1a29a58d6` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `0254f6e993ae5da3` |
| [model-data.csv](model-data.csv) | 11169 | `004150816228550a` |
| [model-summary.txt](model-summary.txt) | 134 | `0fedb727d6607ab6` |
| [model-summary.html](model-summary.html) | 192 | `c3a42269be1d292d` |
