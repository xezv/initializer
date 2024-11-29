#!/usr/bin/env bash
set -euo pipefail

for file in "~/.config/bash/*.sh"; do
    source "$file"
done
