# Model 9: model-09

- Task: `Model`
- Job id: `609746e9c24c`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 9 in bundle A.

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
INTERCEPT=1.50
JOB_DESCRIPTION=Fits sensitivity model 9 in bundle A.
JOB_KEY=model-09
JOB_TITLE=Model 9: model-09
MODEL_INDEX=9
MODEL_SET=A
NOISE_SD=1.25
N_POINTS=120
RUN_LABEL=model-09
SCENARIO_NOTE=Sensitivity model 9 in bundle A.
SEED=2009
SLOPE=0.62
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-fit.rds](model-fit.rds) | 10069 | `ff5fd555b5022f1d` |
| [model-summary.html](model-summary.html) | 191 | `713bfe3b24b5510b` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `9cf2125080eb14a1` |
| [model-data.csv](model-data.csv) | 9102 | `f271e0edcfbd8e3b` |
| [model-summary.csv](model-summary.csv) | 335 | `01390184e9a158fc` |
| [model-summary.txt](model-summary.txt) | 133 | `f6a13bb3dd2c83e0` |
