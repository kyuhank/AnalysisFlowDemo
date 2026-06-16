# Model 22: model-22

- Task: `Model`
- Job id: `b7396cce2b08`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 22 in bundle B.

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
INTERCEPT=2.10
JOB_DESCRIPTION=Fits sensitivity model 22 in bundle B.
JOB_KEY=model-22
JOB_TITLE=Model 22: model-22
MODEL_INDEX=22
MODEL_SET=B
NOISE_SD=0.85
N_POINTS=80
RUN_LABEL=model-22
SCENARIO_NOTE=Sensitivity model 22 in bundle B.
SEED=2022
SLOPE=0.95
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 133 | `37a619a437c78e0a` |
| [model-data.csv](model-data.csv) | 6194 | `d583db474d9a0c25` |
| [model-summary.html](model-summary.html) | 192 | `b875194c21d8eb46` |
| [model-summary.csv](model-summary.csv) | 336 | `69498c3231dcabae` |
| [model-coefficients.csv](model-coefficients.csv) | 184 | `c2795d087b5e8554` |
| [model-fit.rds](model-fit.rds) | 7165 | `76bdc49a3a6463b1` |
