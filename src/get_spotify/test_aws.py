import pytest
import aws
from os import system
from datetime import datetime

now = datetime.now()
timestamp_now = now.strftime("%Y-%m-%dT%H-%M-%S")
test_file_name = f"{timestamp_now}_test_file.deleteme"
print(test_file_name)
system(f"touch '{test_file_name}'")

system(f"rm {test_file_name}")
