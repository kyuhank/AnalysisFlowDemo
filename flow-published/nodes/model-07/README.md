# Model 7: model-07

- Task: `Model`
- Job id: `cd0df34a93d9`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 7 in bundle A.

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
INTERCEPT=2.10
JOB_DESCRIPTION=Fits sensitivity model 7 in bundle A.
JOB_KEY=model-07
JOB_TITLE=Model 7: model-07
MODEL_INDEX=7
MODEL_SET=A
NOISE_SD=0.85
N_POINTS=80
RUN_LABEL=model-07
SCENARIO_NOTE=Sensitivity model 7 in bundle A.
SEED=2007
SLOPE=0.57
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-fit.rds](model-fit.rds) | 7167 | `d9ba3ddc617c6b79` |
| [model-summary.csv](model-summary.csv) | 333 | `043dbf32b58e4372` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `ff387a2ecbb68c4b` |
| [model-summary.txt](model-summary.txt) | 132 | `6f75e421833712dc` |
| [model-data.csv](model-data.csv) | 6090 | `fa7d00b63b26276f` |
| [model-summary.html](model-summary.html) | 191 | `5c0d671e7ee664ce` |
