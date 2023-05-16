from PyInstaller.utils.hooks import copy_metadata

# make sure to add the entrypoints data for localstack-ext
datas = copy_metadata('localstack_ext')
