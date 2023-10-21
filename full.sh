#!/bin/bash

set -u

PROV_PATH="$(dirname "$(realpath $0)")"
for f in $PROV_PATH/utils/*; do source $f; done

info "=== Full provisioning script ==="

set_sudo; detect_os
update_repos

for f in $PROV_PATH/tasks/*; do source $f; done

install_pkgs "vim curl htop tmux"
info "Linking dotfiles"
for f in $PROV_PATH/dotfiles/.*; do ln -sf $f ~; done

install_zsh
setup_workspace
install_pyenv
install_build_tools
install_vscode
