#!/bin/bash

set -u

# Check if running as root
declare SUDOCMD=""
set_sudo () {
  info "User: ${USER}"
  if [ "${USER}" != "root" ]; then
    SUDOCMD="sudo "
  fi
}
