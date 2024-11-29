#!/usr/bin/env bash

set -e

target_dir="/usr/local/tbin"

_unlink() {
    local src_path=$1
    local filename="$(basename "${src_path}")"
    local target_path="${target_dir}/${filename}"

    if [[ -L "${target_path}" ]]; then
        echo "unlink ${target_path}"
        rm "${target_path}"
    else
        echo "file ${target_path} does not exist. nothing to unlink."
    fi
}

if [[ ! -d "${target_dir}" ]]; then
    echo "directory ${target_dir} does not exist. nothing to remove."
    exit 0
else
    rm -rf "${target_dir}"
    echo "remove directory ${target_dir}"
fi

echo "current dir: ${PWD}"
echo "--------------------------------"
for file in "${PWD}/temp/"*; do
    _unlink "${file}"
done
