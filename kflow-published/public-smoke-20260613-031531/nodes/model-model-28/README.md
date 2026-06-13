# Model 28: model-28

- Task: `Model`
- Job id: `d8c15f062bf3`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 28 in bundle C.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot demo default](nodes/plot-job-11/)
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
INTERCEPT=2.40
JOB_DESCRIPTION=Fits sensitivity model 28 in bundle C.
JOB_KEY=model-28
JOB_TITLE=Model 28: model-28
MODEL_INDEX=28
MODEL_SET=C
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-28
SCENARIO_NOTE=Sensitivity model 28 in bundle C.
SEED=2028
SLOPE=1.10
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031531/kflow-flow-da59c4949540-public-smoke-20260613-031531-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-data.csv](model-data.csv) | 8048 | `07455cf9a47dcc33` |
| [model-summary.html](model-summary.html) | 192 | `c25a79f11de24538` |
| [model-fit.rds](model-fit.rds) | 8639 | `66c0e11d8cc9bcd3` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `6edb80e57f8dca26` |
| [model-summary.txt](model-summary.txt) | 134 | `bf601124b2954daf` |
| [model-summary.csv](model-summary.csv) | 338 | `ce25e07e79ddd4f4` |
