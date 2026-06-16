# Model 8: model-08

- Task: `Model`
- Job id: `2158c3c5be7c`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 8 in bundle A.

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
JOB_DESCRIPTION=Fits sensitivity model 8 in bundle A.
JOB_KEY=model-08
JOB_TITLE=Model 8: model-08
MODEL_INDEX=8
MODEL_SET=A
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-08
SCENARIO_NOTE=Sensitivity model 8 in bundle A.
SEED=2008
SLOPE=0.60
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `07996a333df143f1` |
| [model-summary.html](model-summary.html) | 191 | `91534c3405ccb516` |
| [model-summary.csv](model-summary.csv) | 333 | `8ff40288bef1f6ed` |
| [model-fit.rds](model-fit.rds) | 8632 | `577dc674926188e9` |
| [model-summary.txt](model-summary.txt) | 133 | `4f67f8487a4e498c` |
| [model-data.csv](model-data.csv) | 7590 | `691a23dbcbc0b7d8` |
