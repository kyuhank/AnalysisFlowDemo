# Model 26: model-26

- Task: `Model`
- Job id: `3ba0a17acb4c`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 26 in bundle C.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/20057f1df3799442821edf9a325c2a94d4b196df/model)

## Links

- Requires: none
- Feeds:
  - [Plot: Plot bundle C](nodes/plot-c-5/)

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
JOB_DESCRIPTION=Fits sensitivity model 26 in bundle C.
JOB_KEY=model-26
JOB_TITLE=Model 26: model-26
MODEL_INDEX=26
MODEL_SET=C
NOISE_SD=0.65
N_POINTS=60
RUN_LABEL=model-26
SCENARIO_NOTE=Sensitivity model 26 in bundle C.
SEED=2026
SLOPE=1.05
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-summary.txt](model-summary.txt) | 133 | `ea2bcc4f78bc75a8` |
| [model-data.csv](model-data.csv) | 4658 | `5fe65f09f3a34a72` |
| [model-summary.html](model-summary.html) | 192 | `c0b29d8a775f0b04` |
| [model-summary.csv](model-summary.csv) | 334 | `036bdc1f098d1836` |
| [model-coefficients.csv](model-coefficients.csv) | 184 | `79ea15b29bd82258` |
| [model-fit.rds](model-fit.rds) | 5696 | `253dbbc7edad3ea7` |
