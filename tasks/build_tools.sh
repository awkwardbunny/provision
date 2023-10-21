#!/bin/bash

set -ue

install_build_tools() {
	info "Installing common build tools"
	install_pkgs "make cmake clang ninja-build"
}
