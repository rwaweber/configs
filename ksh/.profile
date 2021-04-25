#!/usr/bin/env ksh

RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
GOLDENROD="$(tput setaf 3)"
CYAN="$(tput setaf 4)"
PINK="$(tput setaf 5)"
LBLUE="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
BLANK="$(tput setaf 7)"
RESET="$(tput sgr0)"

PS1='${GREEN}\w${RESET} ${PINK}\u@${RESET}${LBLUE}\h${RESET}\n\t \$ '
