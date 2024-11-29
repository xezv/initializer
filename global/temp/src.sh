#!/usr/bin/env bash

set -e
# temporarily use this file to build the container image

# if the script is sourced, BASH_SOURCE[0] is the script that sourced this script
# and BASH_SOURCE[1] is the script that is being executed
#
# if `/x/y/sh2` is sourced by `/x/sh1`,
# ------------------------------------
# BASH_SOURCE[0] is /x/y/sh2
# BASH_SOURCE[1] is /x/sh1
# dirname(${BASH_SOURCE[0]}) is /x/y
# dirname(${BASH_SOURCE[1]}) is /x
# ------------------------------------
#

src() {
    local filepath=$1
    local dirpath=$(dirname "${BASH_SOURCE[1]}")

    local abspath=$(realpath "${dirpath}")

    if [[ -z "${filepath}" ]]; then
        echo "filepath is required"
        exit 1
    fi

    source "${abspath}/${filepath}"
}

src_all() {
    src()
}

if [[ "$#" == 0 ]]; then
    echo "filepath is required"
    exit 1
fi

src_all "$@"
