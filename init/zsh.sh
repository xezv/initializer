#!/usr/bin/env bash

set -euo pipefail

apk add zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    zsh-completions \
    starship \
    zoxide

# setup starship
starship preset tokyo-night -o ~/.config/starship.toml
