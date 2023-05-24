LocalStack CLI
=======================

This repository contains building instructions for binary builds of the LocalStack CLI.
It does not contain the actual source for the CLI, since the LocalStack CLI is basically just the Python package `localstack` (published on PyPi) with it's install dependencies (and without any extras).
This is why this repository just contains the build config and pipeline that packages the LocalStack CLI python package into a standalone binary using PyInstaller.

## Manual Build

### python3-dev

You need Python developer version libraries in your path to be able to build the distribution.

For most of us who use pyenv, this is done with:
- MacOS:
  ```bash
  env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.10-dev
  ```
- Linux:
  ```bash
  env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.10-dev
  ```

Activate the version:
```
pyenv local 3.10-dev
python --version
```
This should print something like `Python 3.10.11+`.

### make all

Just run

```bash
make clean all
```

in `dist/localstack` you should now find the binary assets.

If you want a single binary you can run `PYINSTALLER_ARGS=-F make clean all`.
This will create a single binary `dist/localstack`.
The single binary has a slower startup time than the binary distribution.
