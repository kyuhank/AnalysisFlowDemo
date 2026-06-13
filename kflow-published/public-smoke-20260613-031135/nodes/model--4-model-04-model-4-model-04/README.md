# Model 4: model-04

- Task: `Model`
- Job id: `e579bc5a7727`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 4 in bundle A.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle A](nodes/plot--1-plot-a-10-plot-bundle-a/)

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
JOB_DESCRIPTION=Fits sensitivity model 4 in bundle A.
JOB_KEY=model-04
JOB_TITLE=Model 4: model-04
MODEL_INDEX=4
MODEL_SET=A
NOISE_SD=1.25
N_POINTS=120
RUN_LABEL=model-04
SCENARIO_NOTE=Sensitivity model 4 in bundle A.
SEED=2004
SLOPE=0.50
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031135/kflow-flow-da59c4949540-public-smoke-20260613-031135-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-fit.rds](model-fit.rds) | 10082 | `ea36dac7b63bcaa1` |
| [model-summary.txt](model-summary.txt) | 133 | `7b1863c3b82494a7` |
| [model-data.csv](model-data.csv) | 9442 | `6483702afc2bbaa0` |
| [model-summary.csv](model-summary.csv) | 337 | `61eb1c8dc5fce7d4` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `8641ad13083e47fa` |
| [model-summary.html](model-summary.html) | 191 | `ab671d3778995e49` |
