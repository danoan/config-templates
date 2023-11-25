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

source .venv/bin/activate

DIST_FOLDER="${OUTPUT_FOLDER}/dist"
mkdir -p "${DIST_FOLDER}"

EXTRACT_FOLDER="${OUTPUT_FOLDER}/extract"
mkdir -p "${EXTRACT_FOLDER}"

pyproject-build --outdir "${DIST_FOLDER}" .

tar -xf ${DIST_FOLDER}/${PROJECT_NAME}-*.tar.gz -C "${EXTRACT_FOLDER}"

popd >/dev/null
