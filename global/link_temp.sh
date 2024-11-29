#!/usr/bin/env bash

set -euo pipefail

source "./temp/link.sh"
source "./temp/register_sh.sh"

# 1. recreate target directory(if exists, so always renew)
# 2.
target_dir="/usr/local/tbin"

if [[ -d "${target_dir}" ]]; then
    echo "directory ${target_dir} already exists. override directory."
    rm -rf "${target_dir}"
fi

mkdir -p "${target_dir}"
user="${USER}"
if [[ -n "${SUDO_USER}" ]]; then
    user="${SUDO_USER}"
fi

echo "user: ${user}"
chown -R "${user}:${user}" "${target_dir}"
echo "create directory ${target_dir}"

echo "current dir: ${PWD}"
echo "--------------------------------"
for file in "${PWD}/temp/"*; do
    register_sh "${file}"
done
