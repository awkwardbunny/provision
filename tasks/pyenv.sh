#!/bin/bash

set -ue

install_pyenv () {
	info "Installing pyenv"
	if [ -d ~/.pyenv ]; then
		warn "PyEnv already installed. skipping"
	else
		git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	fi
	
	cat <<EOF >> ~/workspace/tools/rc
# PyEnv
export PYENV_ROOT="\$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="\$PYENV_ROOT/bin:\$PATH"
eval "\$(pyenv init -)"
#eval "\$(pyenv virtualenv-init -)"

EOF
	info "Installing python build deps"
	install_pkgs "build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev"
}
