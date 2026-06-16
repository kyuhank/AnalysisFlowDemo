# Model 12: model-12

- Task: `Model`
- Job id: `7f1e81d006d3`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 12 in bundle B.

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
JOB_DESCRIPTION=Fits sensitivity model 12 in bundle B.
JOB_KEY=model-12
JOB_TITLE=Model 12: model-12
MODEL_INDEX=12
MODEL_SET=B
NOISE_SD=0.85
N_POINTS=80
RUN_LABEL=model-12
SCENARIO_NOTE=Sensitivity model 12 in bundle B.
SEED=2012
SLOPE=0.70
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-coefficients.csv](model-coefficients.csv) | 181 | `4036f4b94f34cff2` |
| [model-summary.html](model-summary.html) | 192 | `ab2ac201de4e8fa0` |
| [model-summary.txt](model-summary.txt) | 133 | `69900cd4a2f3bb40` |
| [model-summary.csv](model-summary.csv) | 333 | `8dde5883ef5badca` |
| [model-fit.rds](model-fit.rds) | 7186 | `ce7102f860d94889` |
| [model-data.csv](model-data.csv) | 6168 | `6ff559c1cf3bc85f` |
