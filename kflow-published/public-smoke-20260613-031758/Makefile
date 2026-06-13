PYTHON ?= python3

.PHONY: all restore fetch verify summary clean rerun-plan rerun-local

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
	$(PYTHON) reproduce.py rerun-local

clean:
	$(PYTHON) reproduce.py clean
