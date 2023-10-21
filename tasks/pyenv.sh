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
}
