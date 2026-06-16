# Model 20: model-20

- Task: `Model`
- Job id: `bf30f4d58196`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 20 in bundle B.

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
INTERCEPT=2.70
JOB_DESCRIPTION=Fits sensitivity model 20 in bundle B.
JOB_KEY=model-20
JOB_TITLE=Model 20: model-20
MODEL_INDEX=20
MODEL_SET=B
NOISE_SD=1.45
N_POINTS=140
RUN_LABEL=model-20
SCENARIO_NOTE=Sensitivity model 20 in bundle B.
SEED=2020
SLOPE=0.90
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-data.csv](model-data.csv) | 10793 | `467e5f1deb6c080c` |
| [model-summary.txt](model-summary.txt) | 134 | `b183895aa2ae7880` |
| [model-fit.rds](model-fit.rds) | 11488 | `893f35b29bb717f7` |
| [model-summary.html](model-summary.html) | 192 | `9e8c3837bc0df433` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `a3d7d84a87e425cf` |
| [model-summary.csv](model-summary.csv) | 336 | `c351faa8a9ece4d9` |
