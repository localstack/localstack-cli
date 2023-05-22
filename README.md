localstack-packaged-cli
=======================

Repository for the build config that packages the localstack cli into a standalone binary.

## Build

### make all

Just run

```bash
make clean all
```

in `dist/localstack` you should now find the binary assets.

If you want a single binary you can run `PYINSTALLER_ARGS=-F make clean all`.
This will create a single binary `dist/localstack`.
The single binary has a slower startup time than the binary distribution.
