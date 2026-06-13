PYTHON ?= python3

.PHONY: all restore fetch verify summary clean reproduce-local

all: restore

restore: fetch verify summary

fetch:
	$(PYTHON) reproduce.py fetch

verify:
	$(PYTHON) reproduce.py verify

summary:
	$(PYTHON) reproduce.py summary

clean:
	$(PYTHON) reproduce.py clean

reproduce-local:
	@echo "The default make target restores and verifies the saved outputs."
	@echo "To rerun the original analysis, open manifest.json for source folders, commits, commands, and job env."
	@echo "Local reruns depend on the original software/data environment."
