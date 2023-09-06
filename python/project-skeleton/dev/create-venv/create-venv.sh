#! /usr/bin/env bash

SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# PROJECT_PATH="${SCRIPT_PATH%<main_folder_name>*}<main_folder_name>"
PROJECT_PATH="$(cd "${SCRIPT_PATH}" && cd ../.. && pwd)"

INPUT_FOLDER="${SCRIPT_PATH}/input"
OUTPUT_FOLDER="${SCRIPT_PATH}/output"
mkdir -p "${OUTPUT_FOLDER}"

set -e
trap "echo 'Aborted!'" err

pushd "${PROJECT_PATH}" >/dev/null

python3.8 -m venv .venv
source .venv/bin/activate

pip install --upgrade pip
pip install -e .
pip install tox

popd >/dev/null
