#!/bin/bash

set -ue

setup_workspace () {
  info "Creating workspace structure"
  mkdir -p ~/workspace/tools/bin
  cat <<EOF > ~/workspace/tools/rc
TOOLS_DIR="\$HOME/workspace/tools"

# PATH
export PATH="\$TOOLS_DIR/bin:\$PATH"
source \$TOOLS_DIR/aliases

EOF

  cat <<EOF > ~/workspace/tools/aliases
alias hex="hexdump -C"

hexl () {
	hexdump -C \$1 | less
}

EOF

  cat <<EOF >> ~/.zshrc

source ~/workspace/tools/rc
EOF
}
