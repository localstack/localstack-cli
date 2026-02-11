from PyInstaller.utils.hooks import copy_metadata

# make sure to add the entrypoints data for localstack (for plux plugin discovery)
datas = copy_metadata('localstack')
