# Rerun plan

This file records the source folders, commits, commands, public job config values, and input links from the saved flow.

The most portable path is:

```bash
make
```

That restores the saved outputs. A full rerun requires the original software, data access, and any private credentials used by the analysis.

## Steps

### 1. Report: Combined report default

- Source: `kyuhank/AnalysisFlowDemo` / `report`
- Commit: `9457ea109480fb6c4c64aea203075ef6d72e92df`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: Plot: Plot demo default
- Outputs: 7

Public job config:

```text
FLOW_GROUP=linear-demo
JOB_DESCRIPTION=Default report config; run-demo.R submits reports after selected Plot jobs.
JOB_TITLE=Combined report default
REPORT_TITLE=Linear model sensitivity report
REPORT_TONE=short
RUN_LABEL=report-a-b
SCENARIO_NOTE=Combine selected plot outputs into one report.
TAG_DEMO=analysis-flow
TAG_STAGE=report
```

### 2. Plot: Plot demo default

- Source: `kyuhank/AnalysisFlowDemo` / `plot`
- Commit: `9457ea109480fb6c4c64aea203075ef6d72e92df`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: Model: Model 26: model-26
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-demo
JOB_DESCRIPTION=Default plot config; run-demo.R submits Plot A, Plot B, and Plot C from explicit Model job groups.
JOB_TITLE=Plot demo default
MODEL_COUNT=10
MODEL_SET=A
PLOT_COLOR=#1f6f9f
PLOT_TITLE=Model set A sensitivity results
RUN_LABEL=plot-a-10
SCENARIO_NOTE=Plot the first ten model outputs.
TAG_DEMO=analysis-flow
TAG_STAGE=plot
```

### 3. Plot: Plot demo default

- Source: `kyuhank/AnalysisFlowDemo` / `plot`
- Commit: `9457ea109480fb6c4c64aea203075ef6d72e92df`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: Model: Model 19: model-19, Model: Model 21: model-21, Model: Model 18: model-18
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-demo
JOB_DESCRIPTION=Default plot config; run-demo.R submits Plot A, Plot B, and Plot C from explicit Model job groups.
JOB_TITLE=Plot demo default
MODEL_COUNT=10
MODEL_SET=A
PLOT_COLOR=#1f6f9f
PLOT_TITLE=Model set A sensitivity results
RUN_LABEL=plot-a-10
SCENARIO_NOTE=Plot the first ten model outputs.
TAG_DEMO=analysis-flow
TAG_STAGE=plot
```

### 4. Plot: Plot demo default

- Source: `kyuhank/AnalysisFlowDemo` / `plot`
- Commit: `9457ea109480fb6c4c64aea203075ef6d72e92df`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: Model: Model 1: model-01, Model: Model 2: model-02, Model: Model 22: model-22, Model: Model 21: model-21, Model: Model 28: model-28
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-demo
JOB_DESCRIPTION=Default plot config; run-demo.R submits Plot A, Plot B, and Plot C from explicit Model job groups.
JOB_TITLE=Plot demo default
MODEL_COUNT=10
MODEL_SET=A
PLOT_COLOR=#1f6f9f
PLOT_TITLE=Model set A sensitivity results
RUN_LABEL=plot-a-10
SCENARIO_NOTE=Plot the first ten model outputs.
TAG_DEMO=analysis-flow
TAG_STAGE=plot
```

### 5. Report: Combined report default

- Source: `kyuhank/AnalysisFlowDemo` / `report`
- Commit: `9457ea109480fb6c4c64aea203075ef6d72e92df`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: Plot: Plot demo default
- Outputs: 7

Public job config:

```text
FLOW_GROUP=linear-demo
JOB_DESCRIPTION=Default report config; run-demo.R submits reports after selected Plot jobs.
JOB_TITLE=Combined report default
REPORT_TITLE=Linear model sensitivity report
REPORT_TONE=short
RUN_LABEL=report-a-b
SCENARIO_NOTE=Combine selected plot outputs into one report.
TAG_DEMO=analysis-flow
TAG_STAGE=report
```

### 6. Plot: Plot demo default

- Source: `kyuhank/AnalysisFlowDemo` / `plot`
- Commit: `9457ea109480fb6c4c64aea203075ef6d72e92df`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: Model: Model 28: model-28, Model: Model 27: model-27, Model: Model 29: model-29, Model: Model 26: model-26
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-demo
JOB_DESCRIPTION=Default plot config; run-demo.R submits Plot A, Plot B, and Plot C from explicit Model job groups.
JOB_TITLE=Plot demo default
MODEL_COUNT=10
MODEL_SET=A
PLOT_COLOR=#1f6f9f
PLOT_TITLE=Model set A sensitivity results
RUN_LABEL=plot-a-10
SCENARIO_NOTE=Plot the first ten model outputs.
TAG_DEMO=analysis-flow
TAG_STAGE=plot
```

### 7. Model: Model 1: model-01

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=1.80
JOB_DESCRIPTION=Fits sensitivity model 1 in bundle A.
JOB_KEY=model-01
JOB_TITLE=Model 1: model-01
MODEL_INDEX=1
MODEL_SET=A
NOISE_SD=0.65
N_POINTS=60
RUN_LABEL=model-01
SCENARIO_NOTE=Sensitivity model 1 in bundle A.
SEED=2001
SLOPE=0.42
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 8. Model: Model 2: model-02

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=2.10
JOB_DESCRIPTION=Fits sensitivity model 2 in bundle A.
JOB_KEY=model-02
JOB_TITLE=Model 2: model-02
MODEL_INDEX=2
MODEL_SET=A
NOISE_SD=0.85
N_POINTS=80
RUN_LABEL=model-02
SCENARIO_NOTE=Sensitivity model 2 in bundle A.
SEED=2002
SLOPE=0.45
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 9. Model: Model 3: model-03

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=2.40
JOB_DESCRIPTION=Fits sensitivity model 3 in bundle A.
JOB_KEY=model-03
JOB_TITLE=Model 3: model-03
MODEL_INDEX=3
MODEL_SET=A
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-03
SCENARIO_NOTE=Sensitivity model 3 in bundle A.
SEED=2003
SLOPE=0.47
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 10. Model: Model 4: model-04

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
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

### 11. Model: Model 5: model-05

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=2.70
JOB_DESCRIPTION=Fits sensitivity model 5 in bundle A.
JOB_KEY=model-05
JOB_TITLE=Model 5: model-05
MODEL_INDEX=5
MODEL_SET=A
NOISE_SD=1.45
N_POINTS=140
RUN_LABEL=model-05
SCENARIO_NOTE=Sensitivity model 5 in bundle A.
SEED=2005
SLOPE=0.52
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 12. Model: Model 6: model-06

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=1.80
JOB_DESCRIPTION=Fits sensitivity model 6 in bundle A.
JOB_KEY=model-06
JOB_TITLE=Model 6: model-06
MODEL_INDEX=6
MODEL_SET=A
NOISE_SD=0.65
N_POINTS=60
RUN_LABEL=model-06
SCENARIO_NOTE=Sensitivity model 6 in bundle A.
SEED=2006
SLOPE=0.55
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 13. Model: Model 7: model-07

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
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

### 14. Model: Model 8: model-08

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
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

### 15. Model: Model 9: model-09

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
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

### 16. Model: Model 10: model-10

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=2.70
JOB_DESCRIPTION=Fits sensitivity model 10 in bundle A.
JOB_KEY=model-10
JOB_TITLE=Model 10: model-10
MODEL_INDEX=10
MODEL_SET=A
NOISE_SD=1.45
N_POINTS=140
RUN_LABEL=model-10
SCENARIO_NOTE=Sensitivity model 10 in bundle A.
SEED=2010
SLOPE=0.65
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 17. Model: Model 11: model-11

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=1.80
JOB_DESCRIPTION=Fits sensitivity model 11 in bundle B.
JOB_KEY=model-11
JOB_TITLE=Model 11: model-11
MODEL_INDEX=11
MODEL_SET=B
NOISE_SD=0.65
N_POINTS=60
RUN_LABEL=model-11
SCENARIO_NOTE=Sensitivity model 11 in bundle B.
SEED=2011
SLOPE=0.67
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 18. Model: Model 12: model-12

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
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

### 19. Model: Model 13: model-13

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=2.40
JOB_DESCRIPTION=Fits sensitivity model 13 in bundle B.
JOB_KEY=model-13
JOB_TITLE=Model 13: model-13
MODEL_INDEX=13
MODEL_SET=B
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-13
SCENARIO_NOTE=Sensitivity model 13 in bundle B.
SEED=2013
SLOPE=0.72
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 20. Model: Model 14: model-14

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=1.50
JOB_DESCRIPTION=Fits sensitivity model 14 in bundle B.
JOB_KEY=model-14
JOB_TITLE=Model 14: model-14
MODEL_INDEX=14
MODEL_SET=B
NOISE_SD=1.25
N_POINTS=120
RUN_LABEL=model-14
SCENARIO_NOTE=Sensitivity model 14 in bundle B.
SEED=2014
SLOPE=0.75
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 21. Model: Model 15: model-15

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=2.70
JOB_DESCRIPTION=Fits sensitivity model 15 in bundle B.
JOB_KEY=model-15
JOB_TITLE=Model 15: model-15
MODEL_INDEX=15
MODEL_SET=B
NOISE_SD=1.45
N_POINTS=140
RUN_LABEL=model-15
SCENARIO_NOTE=Sensitivity model 15 in bundle B.
SEED=2015
SLOPE=0.77
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 22. Model: Model 16: model-16

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
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

### 23. Model: Model 17: model-17

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
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

### 24. Model: Model 18: model-18

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=2.40
JOB_DESCRIPTION=Fits sensitivity model 18 in bundle B.
JOB_KEY=model-18
JOB_TITLE=Model 18: model-18
MODEL_INDEX=18
MODEL_SET=B
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-18
SCENARIO_NOTE=Sensitivity model 18 in bundle B.
SEED=2018
SLOPE=0.85
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 25. Model: Model 19: model-19

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=1.50
JOB_DESCRIPTION=Fits sensitivity model 19 in bundle B.
JOB_KEY=model-19
JOB_TITLE=Model 19: model-19
MODEL_INDEX=19
MODEL_SET=B
NOISE_SD=1.25
N_POINTS=120
RUN_LABEL=model-19
SCENARIO_NOTE=Sensitivity model 19 in bundle B.
SEED=2019
SLOPE=0.87
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 26. Model: Model 20: model-20

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=2.70
JOB_DESCRIPTION=Fits sensitivity model 20 in bundle B.
JOB_KEY=model-20
JOB_TITLE=Model 20: model-20
MODEL_INDEX=20
MODEL_SET=B
NOISE_SD=1.45
N_POINTS=140
RUN_LABEL=model-20
SCENARIO_NOTE=Sensitivity model 20 in bundle B.
SEED=2020
SLOPE=0.90
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 27. Model: Model 21: model-21

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=1.80
JOB_DESCRIPTION=Fits sensitivity model 21 in bundle B.
JOB_KEY=model-21
JOB_TITLE=Model 21: model-21
MODEL_INDEX=21
MODEL_SET=B
NOISE_SD=0.65
N_POINTS=60
RUN_LABEL=model-21
SCENARIO_NOTE=Sensitivity model 21 in bundle B.
SEED=2021
SLOPE=0.92
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 28. Model: Model 22: model-22

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=2.10
JOB_DESCRIPTION=Fits sensitivity model 22 in bundle B.
JOB_KEY=model-22
JOB_TITLE=Model 22: model-22
MODEL_INDEX=22
MODEL_SET=B
NOISE_SD=0.85
N_POINTS=80
RUN_LABEL=model-22
SCENARIO_NOTE=Sensitivity model 22 in bundle B.
SEED=2022
SLOPE=0.95
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 29. Model: Model 23: model-23

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=2.40
JOB_DESCRIPTION=Fits sensitivity model 23 in bundle B.
JOB_KEY=model-23
JOB_TITLE=Model 23: model-23
MODEL_INDEX=23
MODEL_SET=B
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-23
SCENARIO_NOTE=Sensitivity model 23 in bundle B.
SEED=2023
SLOPE=0.97
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 30. Model: Model 24: model-24

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=1.50
JOB_DESCRIPTION=Fits sensitivity model 24 in bundle B.
JOB_KEY=model-24
JOB_TITLE=Model 24: model-24
MODEL_INDEX=24
MODEL_SET=B
NOISE_SD=1.25
N_POINTS=120
RUN_LABEL=model-24
SCENARIO_NOTE=Sensitivity model 24 in bundle B.
SEED=2024
SLOPE=1.00
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 31. Model: Model 25: model-25

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
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

### 32. Model: Model 26: model-26

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
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

### 33. Model: Model 27: model-27

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=2.10
JOB_DESCRIPTION=Fits sensitivity model 27 in bundle C.
JOB_KEY=model-27
JOB_TITLE=Model 27: model-27
MODEL_INDEX=27
MODEL_SET=C
NOISE_SD=0.85
N_POINTS=80
RUN_LABEL=model-27
SCENARIO_NOTE=Sensitivity model 27 in bundle C.
SEED=2027
SLOPE=1.07
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 34. Model: Model 28: model-28

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=2.40
JOB_DESCRIPTION=Fits sensitivity model 28 in bundle C.
JOB_KEY=model-28
JOB_TITLE=Model 28: model-28
MODEL_INDEX=28
MODEL_SET=C
NOISE_SD=1.05
N_POINTS=100
RUN_LABEL=model-28
SCENARIO_NOTE=Sensitivity model 28 in bundle C.
SEED=2028
SLOPE=1.10
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 35. Model: Model 29: model-29

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=1.50
JOB_DESCRIPTION=Fits sensitivity model 29 in bundle C.
JOB_KEY=model-29
JOB_TITLE=Model 29: model-29
MODEL_INDEX=29
MODEL_SET=C
NOISE_SD=1.25
N_POINTS=120
RUN_LABEL=model-29
SCENARIO_NOTE=Sensitivity model 29 in bundle C.
SEED=2029
SLOPE=1.12
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 36. Model: Model 30: model-30

- Source: `kyuhank/AnalysisFlowDemo` / `model`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: none
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
INTERCEPT=2.70
JOB_DESCRIPTION=Fits sensitivity model 30 in bundle C.
JOB_KEY=model-30
JOB_TITLE=Model 30: model-30
MODEL_INDEX=30
MODEL_SET=C
NOISE_SD=1.45
N_POINTS=140
RUN_LABEL=model-30
SCENARIO_NOTE=Sensitivity model 30 in bundle C.
SEED=2030
SLOPE=1.15
TAG_DEMO=analysis-flow
TAG_STAGE=model
```

### 37. Plot: Plot bundle A

- Source: `kyuhank/AnalysisFlowDemo` / `plot`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: Model: Model 3: model-03, Model: Model 4: model-04, Model: Model 5: model-05, Model: Model 6: model-06, Model: Model 7: model-07, Model: Model 8: model-08, Model: Model 9: model-09, Model: Model 10: model-10, Model: Model 1: model-01, Model: Model 2: model-02
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
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

### 38. Plot: Plot bundle B

- Source: `kyuhank/AnalysisFlowDemo` / `plot`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: Model: Model 11: model-11, Model: Model 12: model-12, Model: Model 13: model-13, Model: Model 14: model-14, Model: Model 15: model-15, Model: Model 16: model-16, Model: Model 17: model-17, Model: Model 25: model-25, Model: Model 22: model-22, Model: Model 19: model-19, Model: Model 21: model-21, Model: Model 18: model-18, Model: Model 23: model-23, Model: Model 24: model-24, Model: Model 20: model-20
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
JOB_DESCRIPTION=Draws one sensitivity plot from 15 Model jobs in bundle B.
JOB_KEY=plot-b-15
JOB_TITLE=Plot bundle B
MODEL_COUNT=15
MODEL_SET=B
PLOT_COLOR=#d65f21
PLOT_TITLE=Bundle B: 15 model fits
RUN_LABEL=plot-b-15
SCENARIO_NOTE=Summarizes model-11 through model-25.
TAG_DEMO=analysis-flow
TAG_STAGE=plot
```

### 39. Plot: Plot bundle C

- Source: `kyuhank/AnalysisFlowDemo` / `plot`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: Model: Model 30: model-30, Model: Model 28: model-28, Model: Model 27: model-27, Model: Model 29: model-29, Model: Model 26: model-26
- Outputs: 6

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
JOB_DESCRIPTION=Draws one sensitivity plot from 5 Model jobs in bundle C.
JOB_KEY=plot-c-5
JOB_TITLE=Plot bundle C
MODEL_COUNT=5
MODEL_SET=C
PLOT_COLOR=#2f8f5f
PLOT_TITLE=Bundle C: 5 model fits
RUN_LABEL=plot-c-5
SCENARIO_NOTE=Summarizes model-26 through model-30.
TAG_DEMO=analysis-flow
TAG_STAGE=plot
```

### 40. Report: Report: bundle C

- Source: `kyuhank/AnalysisFlowDemo` / `report`
- Commit: `91913d964fcfee8de3a9549166031079bbc973e6`
- Command: `bash run.sh`
- Docker image: `ghcr.io/pacificcommunity/bet-2026:v1.9`
- Inputs: Plot: Plot bundle C
- Outputs: 7

Public job config:

```text
FLOW_GROUP=linear-20260611-164809
JOB_DESCRIPTION=Renders one report from Plot bundle C.
JOB_KEY=report-c
JOB_TITLE=Report: bundle C
PLOT_SETS=C
REPORT_TITLE=Linear model report: bundle C (linear-20260611-164809)
REPORT_TONE=short
RUN_LABEL=report-c
SCENARIO_NOTE=Summarizes the 5-model plot bundle.
TAG_DEMO=analysis-flow
TAG_STAGE=report
```
