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

# define the target-arch universal2 to create a binary which works on OSX on M1 and x64 (ignored if not on MacOS)
dist/localstack: main.py
	$(VENV_RUN); pyinstaller main.py \
		$(PYINSTALLER_ARGS) -n localstack \
		--additional-hooks-dir hooks \
		--target-arch universal2 \
		--onefile

build: venv dist/localstack

clean:
	rm -rf build/
	rm -rf dist/

clean-venv:
	rm -rf $(VENV_DIR)

.PHONY: clean clean-venv

