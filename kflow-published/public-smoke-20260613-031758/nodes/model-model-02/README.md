# Model 2: model-02

- Task: `Model`
- Job id: `759ae5543f1a`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 2 in bundle A.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle A](nodes/plot-plot-a-10/)
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
JOB_DESCRIPTION=Fits sensitivity model 2 in bundle A.
JOB_KEY=model-02
JOB_TITLE=Model 2: model-02
MODEL_INDEX=2
MODEL_SET=A
NOISE_SD=0.85
N_POINTS=80
RUN_LABEL=model-02
SCENARIO_NOTE=Sensitivity model 2 in bundle A.
SEED=2002
SLOPE=0.45
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031758/kflow-flow-da59c4949540-public-smoke-20260613-031758-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-fit.rds](model-fit.rds) | 7141 | `efabb102d01fc61b` |
| [model-summary.html](model-summary.html) | 191 | `9271c32eda15fd6c` |
| [model-coefficients.csv](model-coefficients.csv) | 184 | `eadc3f2f513417cc` |
| [model-data.csv](model-data.csv) | 6336 | `e927d7dd83614270` |
| [model-summary.csv](model-summary.csv) | 337 | `0fe1ee4bbbcea84f` |
| [model-summary.txt](model-summary.txt) | 132 | `90f2cc78ea3eed70` |
