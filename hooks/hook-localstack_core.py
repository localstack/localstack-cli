from PyInstaller.utils.hooks import copy_metadata

# make sure to add the entrypoints data for localstack-core
datas = copy_metadata('localstack_core')
