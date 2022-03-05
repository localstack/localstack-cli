import os
os.environ["SKIP_PATCH_MOTO_ACCOUNT_ID"] = "1"
from localstack.cli import main

if __name__ == '__main__':
	main.main()
