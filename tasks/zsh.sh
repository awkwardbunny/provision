#!/bin/bash

set -ue

install_zsh () {
	info "Installing zsh"
	install_pkgs "zsh"
	
	info "Setting default shells"
	${SUDOCMD}chsh -s $(which zsh) $USER
	${SUDOCMD}chsh -s $(which zsh) root
	
	info "Installing oh-my-zsh"
	if [ -d ~/.oh-my-zsh ]; then
		warn "oh-my-zsh already installed. skipping"
	else
		CHSH=no RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi
	sed -i 's/robbyrussell/gallifrey/g' ~/.zshrc
	sed -i 's/^plugins=.*/plugins=\(git sudo\)/g' ~/.zshrc
}
