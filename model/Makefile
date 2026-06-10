.PHONY: all run clean local-test

all: run

run:
	bash run.sh

local-test:
	Rscript -e 'if (nzchar(Sys.getenv("KFLOWKIT_R"))) source(Sys.getenv("KFLOWKIT_R")) else library(KflowKit); kflow_local_test(".", config = "configs/default.env")'

clean:
	rm -rf outputs .kflow-local
