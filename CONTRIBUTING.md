# Contributing

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

### Dev Releases
If a dev release is created, the tag name has to have the same name as the version of `localstack-core` being used (because this is the output of `localstack --version`).
Otherwise, the ["Release Homebrew Tap"](.github/workflows/homebrew.yml) GitHub workflow will not be able to find the artifacts.

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

### Building
You can build the specific versions by calling the respective make target:
```bash
make clean dist-bin/localstack
# or:
make clean dist-dir/localstack
# or both:
make clean all
```
You can find the binary assets in `dist-bin/` and `dist-dir`.
The single binary has a slower startup time than the binary distribution.
