# Model 16: model-16

- Task: `Model`
- Job id: `17a7ff92c12f`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 16 in bundle B.

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
JOB_DESCRIPTION=Fits sensitivity model 16 in bundle B.
JOB_KEY=model-16
JOB_TITLE=Model 16: model-16
MODEL_INDEX=16
MODEL_SET=B
NOISE_SD=0.65
N_POINTS=60
RUN_LABEL=model-16
SCENARIO_NOTE=Sensitivity model 16 in bundle B.
SEED=2016
SLOPE=0.80
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 133 | `f2bbab0ab06fbbc7` |
| [model-summary.csv](model-summary.csv) | 335 | `1e5c0f69ad7aea66` |
| [model-data.csv](model-data.csv) | 4649 | `0c93730ff2a6e1f4` |
| [model-summary.html](model-summary.html) | 192 | `7e3fab6a41e73aa8` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `97782c375c55eedb` |
| [model-fit.rds](model-fit.rds) | 5685 | `6ea2dd108ffcc952` |
