#! /usr/bin/env bash

SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_PATH="$(cd "${SCRIPT_PATH}" && cd ../.. && pwd)"
PROJECT_NAME="$(basename "${PROJECT_PATH}")"

INPUT_FOLDER="${SCRIPT_PATH}/input"
OUTPUT_FOLDER="${SCRIPT_PATH}/output"
mkdir -p "${OUTPUT_FOLDER}"

pushd "${PROJECT_PATH}" >/dev/null

shopt -s globstar
-set -e
-trap "echo 'Aborted!'" err

./dev/clean/clean.sh
python3.8 -m venv .venv

source .venv/bin/activate

pip install --upgrade pip
pip install -e .
pip install build tox

popd >/dev/null
