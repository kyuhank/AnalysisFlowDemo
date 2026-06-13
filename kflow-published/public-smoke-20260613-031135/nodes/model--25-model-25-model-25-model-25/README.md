# Model 25: model-25

- Task: `Model`
- Job id: `bf72f2552096`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 25 in bundle B.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle B](nodes/plot--2-plot-b-15-plot-bundle-b/)

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
JOB_DESCRIPTION=Fits sensitivity model 25 in bundle B.
JOB_KEY=model-25
JOB_TITLE=Model 25: model-25
MODEL_INDEX=25
MODEL_SET=B
NOISE_SD=1.45
N_POINTS=140
RUN_LABEL=model-25
SCENARIO_NOTE=Sensitivity model 25 in bundle B.
SEED=2025
SLOPE=1.02
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031135/kflow-flow-da59c4949540-public-smoke-20260613-031135-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.html](model-summary.html) | 192 | `b5948fe33589df3c` |
| [model-summary.txt](model-summary.txt) | 134 | `63238b60972bade4` |
| [model-data.csv](model-data.csv) | 11244 | `b57fbc21a0ff15ce` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `d271c65ac84dbb39` |
| [model-fit.rds](model-fit.rds) | 11542 | `d3e2dd1bea6bb10d` |
| [model-summary.csv](model-summary.csv) | 340 | `eb61e2f123e68fa1` |
