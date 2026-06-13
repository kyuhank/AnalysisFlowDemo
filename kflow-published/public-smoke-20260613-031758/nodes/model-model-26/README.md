# Model 26: model-26

- Task: `Model`
- Job id: `749354e39c0f`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 26 in bundle C.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle C](nodes/plot-plot-c-5/)
  - [Plot: Plot demo default](nodes/plot-job-13/)
  - [Plot: Plot demo default](nodes/plot-job-5/)

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
JOB_DESCRIPTION=Fits sensitivity model 26 in bundle C.
JOB_KEY=model-26
JOB_TITLE=Model 26: model-26
MODEL_INDEX=26
MODEL_SET=C
NOISE_SD=0.65
N_POINTS=60
RUN_LABEL=model-26
SCENARIO_NOTE=Sensitivity model 26 in bundle C.
SEED=2026
SLOPE=1.05
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-coefficients.csv](model-coefficients.csv) | 184 | `79ea15b29bd82258` |
| [model-summary.html](model-summary.html) | 192 | `c0b29d8a775f0b04` |
| [model-summary.csv](model-summary.csv) | 337 | `f8ac37107ad6dc01` |
| [model-fit.rds](model-fit.rds) | 5698 | `8838b25eaaeb7ea0` |
| [model-summary.txt](model-summary.txt) | 133 | `ea2bcc4f78bc75a8` |
| [model-data.csv](model-data.csv) | 4838 | `7c322af52a13ec3c` |
