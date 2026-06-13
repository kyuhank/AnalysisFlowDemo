# Model 16: model-16

- Task: `Model`
- Job id: `8c9e8ed8426b`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 16 in bundle B.

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
INTERCEPT=1.80
JOB_DESCRIPTION=Fits sensitivity model 16 in bundle B.
JOB_KEY=model-16
JOB_TITLE=Model 16: model-16
MODEL_INDEX=16
MODEL_SET=B
NOISE_SD=0.65
N_POINTS=60
RUN_LABEL=model-16
SCENARIO_NOTE=Sensitivity model 16 in bundle B.
SEED=2016
SLOPE=0.80
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031135/kflow-flow-da59c4949540-public-smoke-20260613-031135-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `97782c375c55eedb` |
| [model-data.csv](model-data.csv) | 4829 | `b70d397379eaebd2` |
| [model-summary.txt](model-summary.txt) | 133 | `f2bbab0ab06fbbc7` |
| [model-summary.html](model-summary.html) | 192 | `7e3fab6a41e73aa8` |
| [model-fit.rds](model-fit.rds) | 5689 | `eb684ad74fe2f780` |
| [model-summary.csv](model-summary.csv) | 338 | `94efc58c353b3f2b` |
