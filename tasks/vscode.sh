#!/bin/bash

set -u

install_vscode () {
	info "Installing VSCode"
	if [ -f "$(which code)" ]; then
		warn "VSCode already installed"
	else
		case $OS in
			Ubuntu|Debian)
				wget -O /tmp/vscode.deb https://code.visualstudio.com/sha/download\?build\=stable\&os\=linux-deb-x64
				${SUDOCMD}apt install /tmp/vscode.deb
				;;
			*)
				echo "Unknown OS"
				exit -1
				;;
		esac
	fi
}
