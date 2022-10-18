VENV_BIN = python3 -m venv
VENV_DIR ?= .venv

ifeq ($(OS), Windows_NT)
	VENV_ACTIVATE = $(VENV_DIR)/Scripts/activate
else
	VENV_ACTIVATE = $(VENV_DIR)/bin/activate
endif

VENV_RUN = . $(VENV_ACTIVATE)

all: venv build

venv: $(VENV_ACTIVATE)

$(VENV_ACTIVATE): requirements.txt
	test -d $(VENV_DIR) || $(VENV_BIN) $(VENV_DIR)
	$(VENV_RUN); pip install --upgrade setuptools wheel
	$(VENV_RUN); pip install -r requirements.txt
	touch $(VENV_ACTIVATE)

# currently botocore and boto3 are required because patch.py of localstack-client>=1.33
# once that is remedied, we can exclude boto3 and botocore modules again
dist/localstack/localstack: main.py
	$(VENV_RUN); pyinstaller main.py \
		-n localstack \
		--exclude-module moto \
		--hidden-import docker
	rm -rf dist/localstack/botocore/data

build: venv dist/localstack/localstack

clean:
	rm -rf build/
	rm -rf dist/

clean-venv:
	rm -rf $(VENV_DIR)

.PHONY: clean clean-venv

