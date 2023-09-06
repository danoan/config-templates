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

rm -rf ${PROJECT_PATH}/dev/**/output
rm -rf ${PROJECT_PATH}/build

rm -rf ${PROJECT_PATH}/**/__pycache__
rm -rf "${PROJECT_PATH}/.tox"
rm -rf ${PROJECT_PATH}/**/*.egg-info

popd >/dev/null
