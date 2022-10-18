import os
from multiprocessing import freeze_support
freeze_support()

os.environ["SKIP_PATCH_MOTO_ACCOUNT_ID"] = "1"
from localstack.cli import main

if __name__ == '__main__':
	main.main()
