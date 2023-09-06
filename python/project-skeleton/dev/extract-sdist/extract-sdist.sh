#! /usr/bin/env bash

SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# PROJECT_PATH="${SCRIPT_PATH%<main_folder_name>*}<main_folder_name>"
PROJECT_PATH="$(cd "${SCRIPT_PATH}" && cd ../.. && pwd)"

OUTPUT_FOLDER="${SCRIPT_PATH}/output"
mkdir -p "${OUTPUT_FOLDER}"

set -e
trap "echo 'Aborted!'" err

pushd "${PROJET_PATH}" >/dev/null

source .venv/bin/activate

DIST_FOLDER="${OUTPUT_FOLDER}/dist"
mkdir -p "${DIST_FOLDER}"

EXTRACT_FOLDER="${OUTPUT_FOLDER}/extract"
mkdir -p "${EXTRACT_FOLDER}"

pyproject-build --outdir "${DIST_FOLDER}" .

tar -xf "${DIST_FOLDER}/toml-dataclass-0.0.1.tar.gz" -C "${EXTRACT_FOLDER}"

popd >/dev/null
