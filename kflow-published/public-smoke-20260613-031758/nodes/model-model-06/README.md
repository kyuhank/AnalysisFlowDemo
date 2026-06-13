# Model 6: model-06

- Task: `Model`
- Job id: `b26005061261`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 6 in bundle A.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle A](nodes/plot-plot-a-10/)

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
JOB_DESCRIPTION=Fits sensitivity model 6 in bundle A.
JOB_KEY=model-06
JOB_TITLE=Model 6: model-06
MODEL_INDEX=6
MODEL_SET=A
NOISE_SD=0.65
N_POINTS=60
RUN_LABEL=model-06
SCENARIO_NOTE=Sensitivity model 6 in bundle A.
SEED=2006
SLOPE=0.55
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.html](model-summary.html) | 191 | `842f24428d9d2d7b` |
| [model-summary.txt](model-summary.txt) | 132 | `0e777f1ef8b9b295` |
| [model-data.csv](model-data.csv) | 4763 | `43bff578a59d1f0d` |
| [model-coefficients.csv](model-coefficients.csv) | 184 | `1a1d147c868e04a3` |
| [model-fit.rds](model-fit.rds) | 5703 | `9e28317707f827ca` |
| [model-summary.csv](model-summary.csv) | 337 | `2c2a6799f49b333b` |
