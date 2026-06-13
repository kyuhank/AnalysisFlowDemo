# Model 27: model-27

- Task: `Model`
- Job id: `a4ae6a54cc9d`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 27 in bundle C.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle C](nodes/plot-plot-c-5/)
  - [Plot: Plot demo default](nodes/plot-job-13/)

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
JOB_DESCRIPTION=Fits sensitivity model 27 in bundle C.
JOB_KEY=model-27
JOB_TITLE=Model 27: model-27
MODEL_INDEX=27
MODEL_SET=C
NOISE_SD=0.85
N_POINTS=80
RUN_LABEL=model-27
SCENARIO_NOTE=Sensitivity model 27 in bundle C.
SEED=2027
SLOPE=1.07
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `1b437558755dec69` |
| [model-data.csv](model-data.csv) | 6456 | `dea3083387996ab4` |
| [model-summary.txt](model-summary.txt) | 133 | `499b84ee1320af78` |
| [model-summary.html](model-summary.html) | 192 | `b75848bea1d3cdc3` |
| [model-fit.rds](model-fit.rds) | 7173 | `298cb38369c5b070` |
| [model-summary.csv](model-summary.csv) | 339 | `8ced137da5dca400` |
