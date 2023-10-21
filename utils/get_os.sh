#!/bin/bash

set -u

# Detect OS/Distro
detect_os () {
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
}
