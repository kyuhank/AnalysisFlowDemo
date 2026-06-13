# Model 9: model-09

- Task: `Model`
- Job id: `33513c61e500`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 9 in bundle A.

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
INTERCEPT=1.50
JOB_DESCRIPTION=Fits sensitivity model 9 in bundle A.
JOB_KEY=model-09
JOB_TITLE=Model 9: model-09
MODEL_INDEX=9
MODEL_SET=A
NOISE_SD=1.25
N_POINTS=120
RUN_LABEL=model-09
SCENARIO_NOTE=Sensitivity model 9 in bundle A.
SEED=2009
SLOPE=0.62
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-data.csv](model-data.csv) | 9462 | `6e9adf5850fb491d` |
| [model-summary.html](model-summary.html) | 191 | `713bfe3b24b5510b` |
| [model-fit.rds](model-fit.rds) | 10075 | `fb117cf4a71e42e4` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `9cf2125080eb14a1` |
| [model-summary.txt](model-summary.txt) | 133 | `f6a13bb3dd2c83e0` |
| [model-summary.csv](model-summary.csv) | 338 | `ecd88bd1b0703c81` |
