localstack-packaged-cli
=======================

Repository for the build config that packages the localstack cli into a standalone binary.

## Build

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
