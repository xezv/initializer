#!/usr/bin/env bash
set -euo pipefail

user="${USERNAME}"
gid=1000
uid=1000
home="/home/${user}"
# modify the default user name, `vscode` to ${USER}
# and change the home directory from `/home/vscode` to `/home/${USER}`

# -l: change the login name of the user
# -d: change the home directory of the user
# -m: move the home directory of the user
# RUN usermod -l ${USER} ${DEFAULT_USER} \
#     && usermod -d /home/${USER} -m ${DEFAULT_USER} \
#     && chown -R ${USER}:${USER} /home/${USER} \
#     # append the sudoers file
#     && echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# create the user group
echo "creating the user group"
groupadd --gid "${gid}" "${user}"

# create the user, and create the home directory for newly created user(if `-m` is specified)
echo "creating the user"
useradd --uid "${uid}" --gid "${gid}" -m "${user}"

# add the user to the sudo group
# append the sudoers file.
# this gives the user the ability to run commands with sudo without password
echo "creating the sudoers directory"
mkdir -p /etc/sudoers.d/

# add the user to the sudo group then user can run commands with sudo
echo "adding the user to the sudo group"
# usermod -aG sudo ${USERNAME}
usermod -aG sudo "${user}"

# append this line to the sudoers file
# so that the user can run commands with sudo without password
echo "appending the sudoers file"
echo "${user} ALL=(ALL) NOPASSWD:ALL" >>"/etc/sudoers.d/${user}"
# change the permission of the sudoers file
# owner 4, group 4, others 0
# so that only the owner can read the file, and the owner and group can write to the file
echo "changing the permission of the sudoers file"
chmod 0440 "/etc/sudoers.d/${user}"

# change the ownership of the home directory to the user
echo "changing the ownership of the home directory"
chown -R "${user}":"${user}" "${home}"

# install sudo
# apt update -y && apt install -y sudo

# cat /etc/sudoers.d/${USERNAME}
