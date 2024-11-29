#!/usr/bin/env bash
set -e

packages=(
    gcc
    gdb
    clang
)

alpine() {

}

arch() {
    pacman -S --needed --noconfirm \
        gcc \
        gdb \
        clang
}

if [ -z "${USERNAME}" ]; then
    user=${USER}
else
    user=${USERNAME}
fi

echo "Installing packages for C"

alpine
arch

echo "Installed packages for C"
