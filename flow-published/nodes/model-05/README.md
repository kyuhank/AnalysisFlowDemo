# Model 5: model-05

- Task: `Model`
- Job id: `cdbfb629a96f`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 5 in bundle A.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/20057f1df3799442821edf9a325c2a94d4b196df/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle A](nodes/plot-a-10/)

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
INTERCEPT=2.70
JOB_DESCRIPTION=Fits sensitivity model 5 in bundle A.
JOB_KEY=model-05
JOB_TITLE=Model 5: model-05
MODEL_INDEX=5
MODEL_SET=A
NOISE_SD=1.45
N_POINTS=140
RUN_LABEL=model-05
SCENARIO_NOTE=Sensitivity model 5 in bundle A.
SEED=2005
SLOPE=0.52
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-data.csv](model-data.csv) | 10593 | `b8f5725c98c71aeb` |
| [model-summary.html](model-summary.html) | 191 | `5592764dbb2f2389` |
| [model-fit.rds](model-fit.rds) | 11508 | `03a9e27a60ffaf9c` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `cc8e4bbb598dca6c` |
| [model-summary.txt](model-summary.txt) | 133 | `26cd925c956328ec` |
| [model-summary.csv](model-summary.csv) | 335 | `7c08b52e55705a79` |
