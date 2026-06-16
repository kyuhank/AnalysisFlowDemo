# Model 17: model-17

- Task: `Model`
- Job id: `d6444ca8474a`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 17 in bundle B.

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
JOB_DESCRIPTION=Fits sensitivity model 17 in bundle B.
JOB_KEY=model-17
JOB_TITLE=Model 17: model-17
MODEL_INDEX=17
MODEL_SET=B
NOISE_SD=0.85
N_POINTS=80
RUN_LABEL=model-17
SCENARIO_NOTE=Sensitivity model 17 in bundle B.
SEED=2017
SLOPE=0.82
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.csv](model-summary.csv) | 335 | `b641c836d0029eef` |
| [model-fit.rds](model-fit.rds) | 7169 | `3a3d2a27214af63f` |
| [model-summary.txt](model-summary.txt) | 133 | `e8e8dd874ef8440c` |
| [model-data.csv](model-data.csv) | 6167 | `f72e1e00b749b90e` |
| [model-coefficients.csv](model-coefficients.csv) | 183 | `66f45f63a5e3fc9a` |
| [model-summary.html](model-summary.html) | 192 | `792329f429a91bcb` |
