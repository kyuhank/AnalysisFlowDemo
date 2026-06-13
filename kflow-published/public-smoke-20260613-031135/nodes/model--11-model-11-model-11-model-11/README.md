# Model 11: model-11

- Task: `Model`
- Job id: `4373a6d646dd`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 11 in bundle B.

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
INTERCEPT=1.80
JOB_DESCRIPTION=Fits sensitivity model 11 in bundle B.
JOB_KEY=model-11
JOB_TITLE=Model 11: model-11
MODEL_INDEX=11
MODEL_SET=B
NOISE_SD=0.65
N_POINTS=60
RUN_LABEL=model-11
SCENARIO_NOTE=Sensitivity model 11 in bundle B.
SEED=2011
SLOPE=0.67
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-da59c4949540-public-smoke-20260613-031135/kflow-flow-da59c4949540-public-smoke-20260613-031135-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.html](model-summary.html) | 192 | `87e67039d552068a` |
| [model-fit.rds](model-fit.rds) | 5714 | `834f09148d65e9c2` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `eb8e7a6bb57b848e` |
| [model-data.csv](model-data.csv) | 4819 | `9393efc2ddc296f6` |
| [model-summary.csv](model-summary.csv) | 339 | `d4f2afa3d74ed9fa` |
| [model-summary.txt](model-summary.txt) | 133 | `2f2235208bfc58cf` |
