# Model 18: model-18

- Task: `Model`
- Job id: `dd7f05788fa4`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 18 in bundle B.

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
JOB_DESCRIPTION=Fits sensitivity model 18 in bundle B.
JOB_KEY=model-18
JOB_TITLE=Model 18: model-18
MODEL_INDEX=18
MODEL_SET=B
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-18
SCENARIO_NOTE=Sensitivity model 18 in bundle B.
SEED=2018
SLOPE=0.85
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-data.csv](model-data.csv) | 7718 | `09237c9cc8d6ec03` |
| [model-summary.txt](model-summary.txt) | 134 | `ed93dabbdb598eb7` |
| [model-fit.rds](model-fit.rds) | 8631 | `64b04a082b51fd7b` |
| [model-summary.html](model-summary.html) | 192 | `256ac7d61cec348a` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `a9fcecca0ccebe0b` |
| [model-summary.csv](model-summary.csv) | 336 | `09952e6e51acfffa` |
