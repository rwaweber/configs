#!/usr/bin/env bash

HERE=`pwd`
SHELL=`ps $$ | grep "sh" | awk '{print $5}'`

curl --version > /dev/null
if [[ $? != 0 ]] 
then
	echo "get curl"
fi

git --version > /dev/null
if [[ $? != 0 ]] 
then
	echo "get git"
fi

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

if [ -a ~/.vim/bundle/vim-bufferline ]
then 
	echo "vim-bufferline installed"
else
	echo "Installing vim-bufferline plugin"
	git clone https://github.com/bling/vim-bufferline ~/.vim/bundle/vim-bufferline
fi

if [ -a ~/.vim/bundle/vim-sensible ]
then 
	echo "vim-sensible installed"
else
	echo "Installing vim-sensible plugin"
	cd ~/.vim/bundle
	git clone https://github.com/tpope/vim-sensible.git
	cd
fi

if [ -a ~/.vim/bundle/vim-monokai ]
then 
	echo "vim-monokai installed"
else
	echo "Installing vim-monokai plugin"
	cd ~/.vim/bundle
	git clone https://github.com/sickill/vim-monokai
	cp -r ~/.vim/bundle/vim-monokai/colors ~/.vim
	cd
fi

if [ -a ~/.vim/bundle/salt-vim ]
then 
	echo "salt-vim installed"
else
	echo "Installing salt-vim plugin"
	cd ~/.vim/bundle
	git clone http://github.com/saltstack/salt-vim.git
	cd
fi


if [ -a ~/.vim/bundle/vim-go ]
then 
	echo "vim-go installed"
else
	echo "Installing vim-go plugin"
	cd ~/.vim/bundle
    git clone https://github.com/fatih/vim-go.git
	cd
fi


cp $HERE/.vimrc ~/.vimrc
