#!/usr/bin/env bash

apk update
apk add --no-cache \
    build-base \
    gcc \
    g++ \
    make \
    cmake \
    python3 \
    python3-dev \
    go \
    rust \
    nodejs \
    npm
