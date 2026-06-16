# Model 23: model-23

- Task: `Model`
- Job id: `c3d2b086fc97`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 23 in bundle B.

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
INTERCEPT=2.40
JOB_DESCRIPTION=Fits sensitivity model 23 in bundle B.
JOB_KEY=model-23
JOB_TITLE=Model 23: model-23
MODEL_INDEX=23
MODEL_SET=B
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-23
SCENARIO_NOTE=Sensitivity model 23 in bundle B.
SEED=2023
SLOPE=0.97
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 134 | `0fc82553f86796c7` |
| [model-summary.csv](model-summary.csv) | 337 | `64fc734a0c996d2f` |
| [model-summary.html](model-summary.html) | 192 | `50a9d99f229901f6` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `cacd34426b855738` |
| [model-fit.rds](model-fit.rds) | 8637 | `4af90f1a853f045c` |
| [model-data.csv](model-data.csv) | 7735 | `f4763b1f8195157d` |
