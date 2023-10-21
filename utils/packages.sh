#!/bin/bash

set -u

# Update package repos
update_repos () {
  case $OS in
    Ubuntu|Debian)
      ${SUDOCMD}apt update
      ;;
    *)
      echo "Unknown OS"
      exit -1
      ;;
  esac
}

install_pkgs () {
  info "Installing: $*"
  case $OS in
    Ubuntu|Debian)
      ${SUDOCMD}apt install -y $@
      ;;
    *)
      echo "Unknown OS"
      exit -1
      ;;
  esac
}
