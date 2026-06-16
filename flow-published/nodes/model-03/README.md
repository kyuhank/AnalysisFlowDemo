# Model 3: model-03

- Task: `Model`
- Job id: `d255ac178c4e`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 3 in bundle A.

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
INTERCEPT=2.40
JOB_DESCRIPTION=Fits sensitivity model 3 in bundle A.
JOB_KEY=model-03
JOB_TITLE=Model 3: model-03
MODEL_INDEX=3
MODEL_SET=A
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-03
SCENARIO_NOTE=Sensitivity model 3 in bundle A.
SEED=2003
SLOPE=0.47
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 133 | `d9016c5f334c55ae` |
| [model-data.csv](model-data.csv) | 7592 | `01f84585b8c894dc` |
| [model-summary.html](model-summary.html) | 191 | `d26a253ddff29983` |
| [model-summary.csv](model-summary.csv) | 332 | `2ec1a9fbfd1b1dc2` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `2eb7ab34a7b7be2c` |
| [model-fit.rds](model-fit.rds) | 8637 | `9fd48053fc23de62` |
