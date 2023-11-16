from PyInstaller.utils.hooks import copy_metadata, collect_data_files

# make sure to add the entrypoints data for localstack-ext
datas = copy_metadata('localstack_ext') + collect_data_files('localstack_ext')
