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
# Reduces `pwd` output to the first letter of each directory beyond the home directory
PROMPT_COMMAND='PS1X=$(perl -pl -e "s|^${HOME}|~|;s|([^/])[^/]*/|$""1/|g" <<<${PWD})'
GIT_PROMPT_ONLY_IN_REPO=1

export GOPATH="$HOME/go"
export PATH="$HOME/bin:/usr/local/bin:$GOPATH/bin:$HOME/.local/bin:$PATH"
export HISTFILESIZE=10000000000
export PS1="${GOLDENROD}[${RESET}${GREEN} \${PS1X}${RESET} ${PINK}\\u${RESET}${PURPLE}@${RESET}${LBLUE}\\h ${RESET}${GOLDENROD}]${RESET}\\n${GREEN}$ ${RESET}"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

if [[ $MACHINE == "Linux" ]]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
    alias ls="ls --color"
elif [[ $MACHINE == "Darwin" ]]; then
    alias ls="ls -G"
    if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
      . "$(brew --prefix)/etc/bash_completion"
    fi
fi

alias ll="ls -lisa"
alias vim="nvim"
alias emc="emacsclient -t -a ''"

# load git prompt if it exists
[[ -s "$HOME/.bash-git-prompt/gitprompt.sh" ]] && source "$HOME/.bash-git-prompt/gitprompt.sh"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.xmodmap" ]] && xmodmap "$HOME/.xmodmap"

export DYLD_LIBRARY_PATH=/usr/local/opt/openssl/lib:$DYLD_LIBRARY_PATH
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
