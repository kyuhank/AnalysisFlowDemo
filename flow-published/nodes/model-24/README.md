# Model 24: model-24

- Task: `Model`
- Job id: `5fbb9c08fec9`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 24 in bundle B.

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
INTERCEPT=1.50
JOB_DESCRIPTION=Fits sensitivity model 24 in bundle B.
JOB_KEY=model-24
JOB_TITLE=Model 24: model-24
MODEL_INDEX=24
MODEL_SET=B
NOISE_SD=1.25
N_POINTS=120
RUN_LABEL=model-24
SCENARIO_NOTE=Sensitivity model 24 in bundle B.
SEED=2024
SLOPE=1.00
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 134 | `6a74df660498f521` |
| [model-data.csv](model-data.csv) | 9252 | `18ca55538c7f314d` |
| [model-summary.html](model-summary.html) | 192 | `0e64b789aa36365c` |
| [model-summary.csv](model-summary.csv) | 332 | `e2544675c15efbca` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `b6b8e1178f6ef285` |
| [model-fit.rds](model-fit.rds) | 10088 | `56188e8ec9f7480b` |
