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

# Reduces `pwd` output to the first letter of each directory beyond the home directory
PROMPT_COMMAND='PS1X=$(perl -pl -e "s|^${HOME}|~|;s|([^/])[^/]*/|$""1/|g" <<<${PWD})'

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export PS1="${GOLDENROD}[${RESET}${GREEN} \${PS1X}${RESET} ${PINK}\\u${RESET}${PURPLE}@${RESET}${LBLUE}\\h ${RESET}${GOLDENROD}]${RESET}\\n${GREEN}$ ${RESET}"

export PATH="$HOME/bin:/usr/local/bin:$GOPATH/bin:$HOME/.local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
MACHINE="$(uname -s)"

# Aliases
alias ll="ls -lisa"
alias vim="nvim"
alias emc="emacsclient -t -a ''"
if [[ $MACHINE == "Linux" ]]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
    alias ls="ls --color"
elif [[ $MACHINE == "Darwin" ]]; then
    alias ls="ls -G"
fi

# Go settings
export GOPATH="$HOME/go"

# enable history search with arrow-keys
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# set history size settings
export HISTSIZE=100000
export HISTFILESIZE=100000

# append history entries.
shopt -s histappend

##
# "If file  exists, do X" blocks
##

# Setup brew-specific settings
if [ -s "/opt/homebrew/bin/brew" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
      source "$(brew --prefix)/etc/bash_completion"
    fi
fi

# load git prompt if it exists
GIT_PROMPT_ONLY_IN_REPO=1
[[ -s "$HOME/.bash-git-prompt/gitprompt.sh" ]] && source "$HOME/.bash-git-prompt/gitprompt.sh"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load xmodmap for linux-specific keybindings
[[ -s "$HOME/.xmodmap" ]] && xmodmap "$HOME/.xmodmap"

# Load cargo settings for rust use
[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# If available, source jabba; java version manager
[[ -s "$HOME/.jabba/jabba.sh" ]] && source "$HOME/.jabba/jabba.sh"

# If a login shell, also pull in bashrc vars. Common behavior on MacOS.
if $(shopt -q login_shell); then
    [[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
fi

# Setup keychain(https://www.funtoo.org/Keychain) for id_ed25519
[[ -s "$HOME/.ssh/id_ed25519" ]] && eval "$(keychain --agents ssh --eval id_ed25519)"

# Setup keychain(https://www.funtoo.org/Keychain) for id_rsa
[[ -s "$HOME/.ssh/id_rsa" ]] && eval "$(keychain --agents ssh --eval id_rsa)"

##
# Python configurations:
#
# First setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# Find python site packages
function python_paths {
    echo "Python3 found here:"
    command -v python3
    echo ""
    echo "Possible site-packages directories here:"
    python3 -c 'import sys; print("\n".join(sys.path))'
}
