# Model 21: model-21

- Task: `Model`
- Job id: `40aec27555ef`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 21 in bundle B.

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
JOB_DESCRIPTION=Fits sensitivity model 21 in bundle B.
JOB_KEY=model-21
JOB_TITLE=Model 21: model-21
MODEL_INDEX=21
MODEL_SET=B
NOISE_SD=0.65
N_POINTS=60
RUN_LABEL=model-21
SCENARIO_NOTE=Sensitivity model 21 in bundle B.
SEED=2021
SLOPE=0.92
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 133 | `34dd9d71b8b07a49` |
| [model-data.csv](model-data.csv) | 4666 | `f647be851b35388c` |
| [model-summary.html](model-summary.html) | 192 | `15ae035c05ad82d3` |
| [model-summary.csv](model-summary.csv) | 333 | `19f7d9c69dd7f3b7` |
| [model-coefficients.csv](model-coefficients.csv) | 181 | `dcee22783dddef2d` |
| [model-fit.rds](model-fit.rds) | 5717 | `b7d06a26b3308686` |
