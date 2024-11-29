#!/usr/bin/env bash
set -euo pipefail

# install base packages
apt-get update
apt-get install -y \
    git \
    curl \
    vim

sudo apk add helix

sudo apk add clang

sudo apk add npm

sudo apk add nodejs

if [ -z "${YAML}" ]; then
    sudo apk add yamllint
fi
