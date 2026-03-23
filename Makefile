VENV_BIN = python3 -m venv
VENV_DIR ?= .venv
PYINSTALLER_ARGS = --distpath=dist-bin --onefile

ifeq ($(OS), Windows_NT)
	VENV_ACTIVATE = $(VENV_DIR)/Scripts/activate
else
	VENV_ACTIVATE = $(VENV_DIR)/bin/activate
endif

VENV_RUN = . $(VENV_ACTIVATE)

all: dist-bin/localstack dist-dir/localstack

venv: $(VENV_ACTIVATE)

$(VENV_ACTIVATE): requirements.txt
	test -d $(VENV_DIR) || $(VENV_BIN) $(VENV_DIR)
	$(VENV_RUN); pip install --upgrade setuptools wheel
	$(VENV_RUN); pip install -r requirements.txt
	touch $(VENV_ACTIVATE)

dist-bin/localstack build: $(VENV_ACTIVATE) main.py
	$(VENV_RUN); pyinstaller main.py \
		--log-level=DEBUG \
		$(PYINSTALLER_ARGS) -n localstack \
		--hidden-import cookiecutter.main \
		--hidden-import cookiecutter.extensions \
		--hidden-import localstack_cli.cli.core_plugin \
		--hidden-import localstack_cli.pro.core.cli.localstack \
		--hidden-import localstack_cli.runtime \
		--hidden-import localstack_cli.runtime.hooks \
		--hidden-import localstack_cli.runtime.exceptions \
		--hidden-import localstack_cli.pro.core.plugins \
		--hidden-import localstack_cli.pro.core.bootstrap.extensions.bootstrap \
		--hidden-import localstack_cli.utils.analytics.metadata \
		--collect-all=rich \
		--collect-data=binaryornot \
		--copy-metadata localstack \
		--additional-hooks-dir hooks

dist-dir/localstack: PYINSTALLER_ARGS=--distpath=dist-dir
dist-dir/localstack: $(VENV_ACTIVATE) main.py build

clean:
	rm -rf build/
	rm -rf dist-bin/
	rm -rf dist-dir/

clean-venv:
	rm -rf $(VENV_DIR)

.PHONY: all build clean clean-venv
