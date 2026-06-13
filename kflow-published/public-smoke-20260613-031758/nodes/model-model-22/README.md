# Model 22: model-22

- Task: `Model`
- Job id: `50313ae7e66c`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 22 in bundle B.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle B](nodes/plot-plot-b-15/)
  - [Plot: Plot demo default](nodes/plot-job-11/)

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
INTERCEPT=2.10
JOB_DESCRIPTION=Fits sensitivity model 22 in bundle B.
JOB_KEY=model-22
JOB_TITLE=Model 22: model-22
MODEL_INDEX=22
MODEL_SET=B
NOISE_SD=0.85
N_POINTS=80
RUN_LABEL=model-22
SCENARIO_NOTE=Sensitivity model 22 in bundle B.
SEED=2022
SLOPE=0.95
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.csv](model-summary.csv) | 339 | `23852c4ac94676e5` |
| [model-fit.rds](model-fit.rds) | 7154 | `e64c3d883a4d00b2` |
| [model-summary.txt](model-summary.txt) | 133 | `37a619a437c78e0a` |
| [model-data.csv](model-data.csv) | 6434 | `5a72ee9bc002eafc` |
| [model-coefficients.csv](model-coefficients.csv) | 184 | `c2795d087b5e8554` |
| [model-summary.html](model-summary.html) | 192 | `b875194c21d8eb46` |
