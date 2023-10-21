#!/bin/bash

set -u

RED='\033[0;31m'
GRN='\033[0;32m'
YLW='\033[0;33m'
RST='\033[0m'

info () {
  printf "${GRN} * $@${RST}\n"
}

warn () {
  printf "${YLW} W $@${RST}\n"
}

error () {
  printf "${RED} E $@${RST}\n"
}
