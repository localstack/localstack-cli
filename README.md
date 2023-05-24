LocalStack CLI
=======================

This repository contains building instructions for binary builds of the LocalStack CLI.
It does not contain the actual source for the CLI, since the LocalStack CLI is basically just the Python package `localstack` (published on PyPi) with it's install dependencies (and without any extras).
This is why this repository just contains the build config and pipeline that packages the LocalStack CLI python package into a standalone binary using PyInstaller.

## Creating a Release
In order to create a release, just perform the following tasks:
- Create a commit which sets a new explicit version for `localstack` in the `requirements.txt`.
  - For example: `localstack==2.1.0`
- Create a tag for the commit: `v<version>`.
  - For example: `git tag v2.1.0`
- Push the tag (`git push origin v<version>`)
- This will trigger the following actions:
  - The tag will trigger the ["Build / Release"](.github/workflows/build.yml) GitHub workflow.
  - It will build the binaries for the different systems and create a GitHub release draft.
- Publish the GitHub release draft.
- This will trigger the ["Release Homebrew Tap"](.github/workflows/homebrew.yml) GitHub workflow.
  - It will take the release artifacts and update the Homebrew formula in [localstack/homebrew-tap](https://github.com/localstack/homebrew-tap).

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
