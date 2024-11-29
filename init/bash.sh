#!/usr/bin/env bash
set -euo pipefail

apk add bash \
    starship

# [Oh-My-Bash]
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# [init Starship]
# -----------------------------------------------------
#
# https://starship.rs/guide/#step-1-install-starship
curl -sS https://starship.rs/install.sh | sh
# https://starship.rs/guide/#step-2-set-up-your-shell-to-use-starship
eval "$(starship init zsh)"
# https://starship.rs/presets/tokyo-night
starship preset tokyo-night -o ~/.config/starship.toml
#
# -----------------------------------------------------
