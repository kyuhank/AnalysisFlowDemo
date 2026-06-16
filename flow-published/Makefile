PYTHON ?= python3

.PHONY: all restore fetch verify summary clean rerun-plan rerun-local run-local run-node list-nodes

all: restore

restore: fetch verify summary

fetch:
	$(PYTHON) reproduce.py fetch

verify:
	$(PYTHON) reproduce.py verify

summary:
	$(PYTHON) reproduce.py summary

rerun-plan:
	$(PYTHON) reproduce.py rerun-plan

rerun-local:
	KFLOW_ALLOW_RERUN=1 $(PYTHON) reproduce.py run-local

run-local:
	KFLOW_ALLOW_RERUN=1 $(PYTHON) reproduce.py run-local

run-node:
	@if [ -z "$(NODE)" ]; then echo "Usage: make run-node NODE=<node-slug-or-number>"; exit 2; fi
	KFLOW_ALLOW_RERUN=1 $(PYTHON) reproduce.py run-node "$(NODE)"

list-nodes:
	$(PYTHON) reproduce.py list-nodes

clean:
	$(PYTHON) reproduce.py clean
