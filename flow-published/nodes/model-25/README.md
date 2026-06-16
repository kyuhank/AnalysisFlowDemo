# Model 25: model-25

- Task: `Model`
- Job id: `05486bac36de`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 25 in bundle B.

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
JOB_DESCRIPTION=Fits sensitivity model 25 in bundle B.
JOB_KEY=model-25
JOB_TITLE=Model 25: model-25
MODEL_INDEX=25
MODEL_SET=B
NOISE_SD=1.45
N_POINTS=140
RUN_LABEL=model-25
SCENARIO_NOTE=Sensitivity model 25 in bundle B.
SEED=2025
SLOPE=1.02
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 134 | `63238b60972bade4` |
| [model-data.csv](model-data.csv) | 10824 | `4fe599a06c8bc178` |
| [model-summary.html](model-summary.html) | 192 | `b5948fe33589df3c` |
| [model-summary.csv](model-summary.csv) | 337 | `7ba6a315cfbe0a52` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `d271c65ac84dbb39` |
| [model-fit.rds](model-fit.rds) | 11512 | `dccefabfd399b83e` |
