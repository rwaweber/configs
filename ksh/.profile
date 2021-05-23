#!/usr/bin/env ksh
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
export PATH HOME TERM

alias ls="colorls -G"
alias ll="ls -Glah"

RED="$(tput setaf 1 0 0)"
GREEN="$(tput setaf 2 0 0)"
GOLDENROD="$(tput setaf 3 0 0)"
CYAN="$(tput setaf 4 0 0)"
PINK="$(tput setaf 5 0 0)"
LBLUE="$(tput setaf 6 0 0)"
WHITE="$(tput setaf 7 0 0)"
BLANK="$(tput setaf 7 0 0)"
RESET="$(tput sgr0)"

PS1='${GREEN}\w${RESET} ${PINK}\u@${RESET}${LBLUE}\h${RESET}\n\t \$ '
