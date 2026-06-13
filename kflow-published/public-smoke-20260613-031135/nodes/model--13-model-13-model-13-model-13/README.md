# Model 13: model-13

- Task: `Model`
- Job id: `6cc8534c1219`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 13 in bundle B.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/91913d964fcfee8de3a9549166031079bbc973e6/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle B](nodes/plot--2-plot-b-15-plot-bundle-b/)

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
JOB_DESCRIPTION=Fits sensitivity model 13 in bundle B.
JOB_KEY=model-13
JOB_TITLE=Model 13: model-13
MODEL_INDEX=13
MODEL_SET=B
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-13
SCENARIO_NOTE=Sensitivity model 13 in bundle B.
SEED=2013
SLOPE=0.72
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031135/kflow-flow-da59c4949540-public-smoke-20260613-031135-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 134 | `721d7d1c9571d8c0` |
| [model-coefficients.csv](model-coefficients.csv) | 184 | `ea6fff756e43468b` |
| [model-fit.rds](model-fit.rds) | 8655 | `f4a280ad99f3d269` |
| [model-summary.html](model-summary.html) | 192 | `3cac6ca887baca3a` |
| [model-summary.csv](model-summary.csv) | 340 | `abbcdf41f81bd8c7` |
| [model-data.csv](model-data.csv) | 7983 | `2f9dfdf1da82c18c` |
