#!/usr/bin/env bash

if [ -a ~/.vimrc ]
then
    echo "Backing up old vim configuration"
    cp ~/.vimrc ~/.vimrc.prebootstrap
    # keeping old versions
fi

if [ -a ~/.vim/autoload/pathogen.vim ]
then
    echo "Pathogen already installed"
else
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# usage: pathogen_install https://github.com/tpope/vim-sensible v1.2 vim-sensible
# args: location, release, package_name
function pathogen_install() {
    if [ -a ~/.vim/bundle/$3 ]; then
        echo "$3 installed, skipping..."
    else
        echo "Installing $3 plugin at release: $2"
        cd ~/.vim/bundle
        git clone $1 --branch $2
    fi
}

pathogen_install https://github.com/tpope/vim-sensible v1.2 vim-sensible
pathogen_install https://github.com/junegunn/goyo.vim v1.6.0 goyo.vim
pathogen_install https://github.com/junegunn/limelight.vim master limelight.vim
pathogen_install https://github.com/junegunn/seoul256.vim master seoul256.vim
pathogen_install https://github.com/vim-syntastic/syntastic 3.8.0 syntastic
pathogen_install https://github.com/vim-airline/vim-airline v0.9 vim-airline
pathogen_install https://github.com/tpope/vim-fugitive v2.2 vim-fugitive
pathogen_install https://github.com/scrooloose/nerdtree master nerdtree
