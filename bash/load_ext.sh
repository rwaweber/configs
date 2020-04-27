#!/usr/bin/env bash

if [ -f "$($HOME)/.bash-git-prompt/gitprompt.sh" ]; then
    echo "Git prompt installed"
else
    cd ~ || exit
    git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
fi
