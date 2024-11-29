#!/usr/bin/env bash

apk update
apk add --no-cache \
    alpine-utils \
    curl \
    git \
    vim \
    openssh \
    sudo \
    wget
