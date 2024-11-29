#!/usr/bin/env bash

is_admin() {
    local user_groups=$(groups "${USER}")

    # groups name for giving sudo permission to users
    # admin - macOS
    # sudo - debian based distro like ubuntu, debian
    # wheel - archlinux & red hat based distro like fedora, centos, RHEL

    # grep
    # -q: quiet mode, just check if pattern is matched without output
    # -w: whole word, pattern is matched as a whole word
    if echo "${user_groups}" | grep -qw "sudo" ||
        echo "${user_groups}" | grep -qw "admin" ||
        echo "${user_groups}" | grep -qw "wheel"; then
        return 0
    fi
    return 1
}
