RED="\\[$(tput setaf 1)\\]"
GREEN="\\[$(tput setaf 2)\\]"
GOLDENROD="\\[$(tput setaf 3)\\]"
CYAN="\\[$(tput setaf 4)\\]"
PINK="\\[$(tput setaf 5)\\]"
LBLUE="\\[$(tput setaf 6)\\]"
WHITE="\\[$(tput setaf 7)\\]"
BLANK="\\[$(tput setaf 7)\\]"
ORANGE="\\[$(tput setaf 9)\\]"
PURPLE="\\[$(tput setaf 13)\\]"
RESET="\\[$(tput sgr0)\\]"
MACHINE="$(uname -s)"

alias ls="ls --color"
alias ll="ls -lisa"
alias emc="emacsclient -t -a ''"
alias vim="nvim"

if [[ $MACHINE == "Linux" ]]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
elif [[ $MACHINE == "Darwin" ]]; then
    if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
      . "$(brew --prefix)/etc/bash_completion"
    fi
fi

export GOPATH="$HOME/go"
export PATH="$HOME/bin:/usr/local/bin:$GOPATH/bin:$HOME/.local/bin:$PATH"
export HISTFILESIZE=10000000000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

PROMPT_COMMAND='PS1X=$(perl -pl -e "s|^${HOME}|~|;s|([^/])[^/]*/|$""1/|g" <<<${PWD})'

if [[ ${USER} != "root" ]]; then
    export PS1="${GOLDENROD}[${RESET}${GREEN} \${PS1X}${RESET} ${PINK}\\u${RESET}${PURPLE}@${RESET}${LBLUE}\\h ${RESET}${GOLDENROD}]${RESET}\\n${GREEN}$ ${RESET}"
else
    export PS1="${GOLDENROD}[${RESET}${GREEN} \${PS1X}${RESET} ${RED}\\u${RESET}${PURPLE}@${RESET}${LBLUE}\\h ${RESET}${GOLDENROD}]${RESET}\\n${RED}# ${RESET}"
fi

GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh
