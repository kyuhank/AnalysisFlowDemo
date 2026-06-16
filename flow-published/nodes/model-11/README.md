# Model 11: model-11

- Task: `Model`
- Job id: `6cc9f0b3e1ec`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 11 in bundle B.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/20057f1df3799442821edf9a325c2a94d4b196df/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle B](nodes/plot-b-15/)

## Run settings

- Source repository: `kyuhank/AnalysisFlowDemo`
- Source folder: `model`
- Commit: `20057f1df3799442821edf9a325c2a94d4b196df`
- Command: `bash run.sh`
- Make target: `all`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Resources: `CPU 1 · memory 2GB · disk 2GB`

Public job config:

```text
FLOW_GROUP=guide-20260616-0056
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
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-data.csv](model-data.csv) | 4639 | `61e26927245f45b1` |
| [model-summary.txt](model-summary.txt) | 133 | `2f2235208bfc58cf` |
| [model-fit.rds](model-fit.rds) | 5709 | `2f865827af6282c8` |
| [model-summary.html](model-summary.html) | 192 | `87e67039d552068a` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `eb8e7a6bb57b848e` |
| [model-summary.csv](model-summary.csv) | 336 | `619c9e2133e684af` |
