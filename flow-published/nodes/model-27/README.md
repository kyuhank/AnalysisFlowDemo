# Model 27: model-27

- Task: `Model`
- Job id: `9a839b6303fb`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 27 in bundle C.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/20057f1df3799442821edf9a325c2a94d4b196df/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle C](nodes/plot-c-5/)

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
JOB_DESCRIPTION=Fits sensitivity model 27 in bundle C.
JOB_KEY=model-27
JOB_TITLE=Model 27: model-27
MODEL_INDEX=27
MODEL_SET=C
NOISE_SD=0.85
N_POINTS=80
RUN_LABEL=model-27
SCENARIO_NOTE=Sensitivity model 27 in bundle C.
SEED=2027
SLOPE=1.07
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 133 | `499b84ee1320af78` |
| [model-data.csv](model-data.csv) | 6216 | `da149f515785e16f` |
| [model-summary.html](model-summary.html) | 192 | `b75848bea1d3cdc3` |
| [model-summary.csv](model-summary.csv) | 336 | `51bd55ccec1aa410` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `1b437558755dec69` |
| [model-fit.rds](model-fit.rds) | 7181 | `7d825b8ac0456836` |
