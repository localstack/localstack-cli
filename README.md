LocalStack CLI
=======================

This repository contains building instructions for binary builds of the LocalStack CLI.
It does not contain the actual source for the CLI, since the LocalStack CLI is basically just the Python package `localstack` (published on PyPi) with it's install dependencies (and without any extras).
This is why this repository just contains the build config and pipeline that packages the LocalStack CLI python package into a standalone binary using PyInstaller.

## Installation
Please make sure that you have a working [`docker` environment](https://docs.docker.com/get-docker/) on your machine before moving on.

### Brew (MacOS or Linux with Homebrew)
Install the LocalStack CLI by using our [official LocalStack Brew Tap](https://github.com/localstack/homebrew-tap):
```
$ brew install localstack/tap/localstack-cli
```

### Binary download (MacOS, Linux, Windows)
If you do not have Brew on your machine, you can directly download the pre-built LocalStack CLI binary for your system:
- [Download the latest release for your platform](https://github.com/localstack/localstack-cli/releases/latest)
- Extract the archive to a folder in your `PATH` variable:
  - MacOS / Linux: ```sudo tar xvzf ~/Downloads/localstack-cli-*-darwin-*-onefile.tar.gz -C /usr/local/bin```