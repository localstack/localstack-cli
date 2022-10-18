localstack-packaged-cli
=======================

Repository for the build config that packages the localstack cli into a standalone binary.

## Build

### python3-dev

You need Python developer version libraries in your path to be able to build the distribution.

For most of us who use pyenv, this is done with

```bash
pyenv install 3.8-dev
pyenv local 3.8-dev
python --version
```

should print something like `Python 3.8.15+`.

### make all

Just run

```bash
make clean all
```

in `dist/localstack` you should now find the binary assets.

If you want a single binary you can run `PYINSTALLER_ARGS=-F make clean all`.
This will create a single binary `dist/localstack`.
The single binary has a slower startup time than the binary distribution.
