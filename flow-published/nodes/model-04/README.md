# Model 4: model-04

- Task: `Model`
- Job id: `88cb1944866f`
- Status: `completed`
- Owner: `kyuhank`

Fits sensitivity model 4 in bundle A.

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
JOB_DESCRIPTION=Fits sensitivity model 4 in bundle A.
JOB_KEY=model-04
JOB_TITLE=Model 4: model-04
MODEL_INDEX=4
MODEL_SET=A
NOISE_SD=1.25
N_POINTS=120
RUN_LABEL=model-04
SCENARIO_NOTE=Sensitivity model 4 in bundle A.
SEED=2004
SLOPE=0.50
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-fit.rds](model-fit.rds) | 10077 | `dc79d19ed9aa527d` |
| [model-summary.txt](model-summary.txt) | 133 | `7b1863c3b82494a7` |
| [model-data.csv](model-data.csv) | 9082 | `ed88d0af3ef44f9d` |
| [model-summary.csv](model-summary.csv) | 334 | `dbd6585f14c483a9` |
| [model-coefficients.csv](model-coefficients.csv) | 182 | `8641ad13083e47fa` |
| [model-summary.html](model-summary.html) | 191 | `ab671d3778995e49` |
