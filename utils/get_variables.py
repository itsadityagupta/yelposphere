import json
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument("--input", required=True)
parser.add_argument("--output", required=True)

args = parser.parse_args()

with open(args.input, 'r') as f:
    variables = json.load(f)

output = {}

for key, value in variables.items():
    output[key] = value['value']

with open(args.output, 'w') as f:
    json.dump(output, f)
