# Model 30: model-30

- Task: `Model`
- Job id: `4b078d68a5bb`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 30 in bundle C.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle C](nodes/plot-plot-c-5/)

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
JOB_DESCRIPTION=Fits sensitivity model 30 in bundle C.
JOB_KEY=model-30
JOB_TITLE=Model 30: model-30
MODEL_INDEX=30
MODEL_SET=C
NOISE_SD=1.45
N_POINTS=140
RUN_LABEL=model-30
SCENARIO_NOTE=Sensitivity model 30 in bundle C.
SEED=2030
SLOPE=1.15
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-fit.rds](model-fit.rds) | 11557 | `4f5f276020b0f014` |
| [model-summary.csv](model-summary.csv) | 340 | `62c8bdaef2f512b9` |
| [model-coefficients.csv](model-coefficients.csv) | 184 | `8f582aa62e665e28` |
| [model-summary.txt](model-summary.txt) | 134 | `fa263bf97f3385ee` |
| [model-data.csv](model-data.csv) | 11240 | `cbb4b4a318a28a47` |
| [model-summary.html](model-summary.html) | 192 | `22fb5131984fbe09` |
