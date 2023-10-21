#!/bin/bash

set -u

RED='\033[0;31m'
GRN='\033[0;32m'
RST='\033[0m'

info () {
  printf "${GRN} * $@${RST}\n"
}

error () {
  printf "${RED} E $@${RST}\n"
}

info "=== Provisioning initialization script==="

# Check if running as root
declare SUDOCMD=""
info "User: ${USER}"
if [ "${USER}" != "root" ]; then
  SUDOCMD="sudo "
fi

# Detect OS/Distro
if [ -f /etc/os-release ]; then
  . /etc/os-release
  OS=$NAME
  VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
  OS=$(lsb_release -si)
  VER=$(lsb_release -sr)
else
  OS=$(uname -s)
  VER=$(uname -r)
fi
info "Detected OS: $OS $VER"

case $OS in
  Ubuntu|Debian)
    ${SUDOCMD}apt update
    ${SUDOCMD}apt install git
    ;;
  *)
    echo "Unknown OS"
    exit -1
    ;;
esac

info "=== Fetching the full provision ==="
git clone https://github.com/awkwardbunny/provision ~/.provision
~/.provision/full.sh
