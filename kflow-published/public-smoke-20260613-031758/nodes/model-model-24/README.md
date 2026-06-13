# Model 24: model-24

- Task: `Model`
- Job id: `40c7b0200be8`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 24 in bundle B.

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
INTERCEPT=1.50
JOB_DESCRIPTION=Fits sensitivity model 24 in bundle B.
JOB_KEY=model-24
JOB_TITLE=Model 24: model-24
MODEL_INDEX=24
MODEL_SET=B
NOISE_SD=1.25
N_POINTS=120
RUN_LABEL=model-24
SCENARIO_NOTE=Sensitivity model 24 in bundle B.
SEED=2024
SLOPE=1.00
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-fit.rds](model-fit.rds) | 10093 | `46636e28cb4c65e7` |
| [model-summary.csv](model-summary.csv) | 335 | `561a5c3ccfadcecf` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `b6b8e1178f6ef285` |
| [model-summary.txt](model-summary.txt) | 134 | `6a74df660498f521` |
| [model-data.csv](model-data.csv) | 9612 | `3deb09713d65603f` |
| [model-summary.html](model-summary.html) | 192 | `0e64b789aa36365c` |
