# Model 8: model-08

- Task: `Model`
- Job id: `f96e3366435d`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 8 in bundle A.

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
JOB_DESCRIPTION=Fits sensitivity model 8 in bundle A.
JOB_KEY=model-08
JOB_TITLE=Model 8: model-08
MODEL_INDEX=8
MODEL_SET=A
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-08
SCENARIO_NOTE=Sensitivity model 8 in bundle A.
SEED=2008
SLOPE=0.60
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031531/kflow-flow-da59c4949540-public-smoke-20260613-031531-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `07996a333df143f1` |
| [model-data.csv](model-data.csv) | 7890 | `13f692111c04c1c2` |
| [model-summary.txt](model-summary.txt) | 133 | `4f67f8487a4e498c` |
| [model-summary.html](model-summary.html) | 191 | `91534c3405ccb516` |
| [model-fit.rds](model-fit.rds) | 8639 | `88b86f03109a7695` |
| [model-summary.csv](model-summary.csv) | 336 | `682852429e1b3bd4` |
