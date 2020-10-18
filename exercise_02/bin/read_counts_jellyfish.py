import re
from argparse import *

parser = argparse.ArgumentParser()
parser.add_argument('filename')
args = parser.parse_args()


with open(args.filename) as file:
    chunk = re.findall(r"^#")
    print(chunk)
