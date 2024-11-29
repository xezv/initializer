#!/usr/bin/env bash

set -euo pipefail

envs=(
    "USER"
    "USERNAME"
    "USER_HOME"
)

for env in "${envs[@]}"; do
    if [ -z "${env}" ]; then
        echo "Environment variable ${env} is not set"
        exit 1
    fi
done
