# Model 3: model-03

- Task: `Model`
- Job id: `293d787a0b58`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 3 in bundle A.

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
INTERCEPT=2.40
JOB_DESCRIPTION=Fits sensitivity model 3 in bundle A.
JOB_KEY=model-03
JOB_TITLE=Model 3: model-03
MODEL_INDEX=3
MODEL_SET=A
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-03
SCENARIO_NOTE=Sensitivity model 3 in bundle A.
SEED=2003
SLOPE=0.47
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031531/kflow-flow-da59c4949540-public-smoke-20260613-031531-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.csv](model-summary.csv) | 335 | `09ea4e0fc8e9b8c0` |
| [model-fit.rds](model-fit.rds) | 8644 | `b2a2a83cb8ddf821` |
| [model-summary.txt](model-summary.txt) | 133 | `d9016c5f334c55ae` |
| [model-data.csv](model-data.csv) | 7892 | `e5beb4e6e3f39be0` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `2eb7ab34a7b7be2c` |
| [model-summary.html](model-summary.html) | 191 | `d26a253ddff29983` |
