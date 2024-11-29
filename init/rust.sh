#!/usr/bin/env bash
set -euo pipefail

if [ -z "${USERNAME}" ]; then
    user=${USER}
else
    user=${USERNAME}
fi

# set the cargo and rustup home directories to /usr/local
# to install rust globally
export CARGO_HOME="${USER_HOME}/.cargo"
export RUSTUP_HOME="${USER_HOME}/.rustup"

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# ensure the non-root user can access to the rust installation
chown -R "${USERNAME}:${USERNAME}" "${CARGO_HOME}" "${RUSTUP_HOME}"

# create the rust.sh file in /etc/profile.d
# all the `.sh` files in /etc/profile.d are automatically executed
# when the login shell is started. any kind of shell can be used(sh, bash, zsh, fish, etc.)
# mkdir -p /etc/profile.d

# # group all the echo result into a continous stream
# # 1.
# {
#     echo "export CARGO_HOME=${CARGO_HOME}"
#     echo "export RUSTUP_HOME=${RUSTUP_HOME}"
#     echo "export PATH=${CARGO_HOME}/bin:\${PATH}"
# } | tee -a /etc/profile.d/rust.sh

# # 2. here doc
cat <<EOF >>"${CARGO_HOME}/env"
export CARGO_HOME="${CARGO_HOME}"
export RUSTUP_HOME="${RUSTUP_HOME}"
export PATH="${CARGO_HOME}/bin:\${PATH}"
EOF

cat <<EOF >>"/etc/profile.d/rust.sh"
source "${CARGO_HOME}/env"
EOF

# echo "Defaults secure_path+=\"${CARGO_HOME}/bin\"" >>"/etc/sudoers.d/${USERNAME}"

# cat <<EOF >>"/root/.config/fish/conf.d/rust.fish"
# source "${CARGO_HOME}/env.fish"
# EOF

# make the file executable for all users
# chmod +x /etc/profile.d/rust.sh

# apply env to the current shell and user configs
source "${CARGO_HOME}/env"

# setup rust globally
rustup default stable
rustup component add cargo rust-analyzer rustfmt

# keep the env variables for sudo
cat <<EOF >/etc/sudoers.d/rust
Defaults env_keep += "CARGO_HOME RUSTUP_HOME"
EOF

# link the cargo command to /usr/sbin
ln -s "${CARGO_HOME}/bin/cargo" /usr/sbin/cargo

# cat <<EOF >/${CARGO_HOME}/env.fish
# set -x CARGO_HOME "/usr/local/cargo"
# set -x RUSTUP_HOME "/usr/local/rustup"
# set -x PATH "$CARGO_HOME/bin" $PATH
# EOF

# apply environment variables to the current shell
# chmod +x /etc/profile.d/rust.sh

# Create the env files for bash and fish
# mkdir -p "${CARGO_HOME}"
# cat <<EOF >"${CARGO_HOME}/env"
# export CARGO_HOME="${CARGO_HOME}"
# export RUSTUP_HOME="${RUSTUP_HOME}"
# export PATH="${CARGO_HOME}/bin:\${PATH}"
# EOF

# cat <<EOF >"${CARGO_HOME}/env.fish"
# set -x CARGO_HOME "${CARGO_HOME}"
# set -x RUSTUP_HOME "${RUSTUP_HOME}"
# set -x PATH "${CARGO_HOME}/bin" \$PATH
# EOF

# for bash
# for rc_file in "/root/.bashrc" "${USER_HOME}/.bashrc"; do
#     echo "source \"${CARGO_HOME}/env\"" | tee -a "${rc_file}" >/dev/null
# done

# # for fish
# for fish_conf in "/root/.config/fish/conf.d/rust.fish" "${USER_HOME}/.config/fish/conf.d/rust.fish"; do
#     echo "source \"${CARGO_HOME}/env.fish\"" | tee -a "${fish_conf}" >/dev/null
# done

# setup rust for the non-root user
# su - "${USERNAME}" <<EOF
# source "${CARGO_HOME}/env"
# rustup default stable
# EOF

# # with `-a`, append the content to the file
# cat <<EOF | tee -a "/root/.bashrc" "${USER_HOME}/.bashrc" >/dev/null
#     source "${CARGO_HOME}/env"
# EOF

# # echo "source \"${CARGO_HOME}/env\"" >>~/.bashrc
# cat <<EOF | tee -a "/root/.config/fish/conf.d/set_cargo_env.fish" "${USER_HOME}/.config/fish/conf.d/set_cargo_env.fish" >/dev/null
#     source "${CARGO_HOME}/env.fish"
# EOF

# # -E: keep the current env context
# sudo -E -u "${USERNAME}" bash -c "rustup default stable"
# sudo -E -u "${USERNAME}" bash -c "rustup component add cargo rust-analyzer rustfmt"

# # check if the command is installed
# check_command() {
#     local CMD=$1
#     if ! command -v "$CMD" &>/dev/null; then
#         echo "failed to install $CMD"
#         exit 1
#     fi
# }

# for CMD in cargo rustup rustc rustfmt rust-analyzer; do
#     check_command "$CMD"
# done
