# Plot bundle A

- Task: `Plot`
- Job id: `7a009ae8b80f`
- Status: `completed`
- Owner: `kyuhank`

Draws one sensitivity plot from 10 Model jobs in bundle A.

[Open source folder at the saved commit](https://github.com/kyuhank/AnalysisFlowDemo/tree/20057f1df3799442821edf9a325c2a94d4b196df/plot)

## Links

- Requires:
  - [Model: Model 1: model-01](nodes/model-01/)
  - [Model: Model 2: model-02](nodes/model-02/)
  - [Model: Model 3: model-03](nodes/model-03/)
  - [Model: Model 4: model-04](nodes/model-04/)
  - [Model: Model 5: model-05](nodes/model-05/)
  - [Model: Model 6: model-06](nodes/model-06/)
  - [Model: Model 7: model-07](nodes/model-07/)
  - [Model: Model 8: model-08](nodes/model-08/)
  - [Model: Model 9: model-09](nodes/model-09/)
  - [Model: Model 10: model-10](nodes/model-10/)
- Feeds:
  - [Report: Report: bundles A+B](nodes/report-a-b/)

## Run settings

- Source repository: `kyuhank/AnalysisFlowDemo`
- Source folder: `plot`
- Commit: `20057f1df3799442821edf9a325c2a94d4b196df`
- Command: `bash run.sh`
- Make target: `all`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Resources: `CPU 1 · memory 2GB · disk 2GB`

Public job config:

```text
FLOW_GROUP=guide-20260616-0056
JOB_DESCRIPTION=Draws one sensitivity plot from 10 Model jobs in bundle A.
JOB_KEY=plot-a-10
JOB_TITLE=Plot bundle A
MODEL_COUNT=10
MODEL_SET=A
PLOT_COLOR=#1f6f9f
PLOT_TITLE=Bundle A: 10 model fits
RUN_LABEL=plot-a-10
SCENARIO_NOTE=Summarizes model-01 through model-10.
TAG_DEMO=analysis-flow
TAG_STAGE=plot
```

## Outputs

After `make`, this node's files are restored under `outputs/` in this folder.
You can also download the full release bundle: https://github.com/kyuhank/AnalysisFlowDemo/releases/download/kflow-flow-398592774392/kflow-flow-398592774392-outputs.tar.gz

| File | Size | SHA-256 |
| --- | ---: | --- |
| [model-sensitivity-plot.svg](model-sensitivity-plot.svg) | 346389 | `e37518ae17faee38` |
| [plot-summary.csv](plot-summary.csv) | 308 | `74b056ebd511fc38` |
| [plot-model-summaries.csv](plot-model-summaries.csv) | 1603 | `f38585aec3e4b976` |
| [plot-summary.html](plot-summary.html) | 195 | `498acd2c86c4615c` |
| [plot-summary.txt](plot-summary.txt) | 153 | `3810053e64961f47` |
| [plot-model-coefficients.csv](plot-model-coefficients.csv) | 1251 | `4217fa55015a3052` |
