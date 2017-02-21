#!/bin/bash

sudo apt-get update

sudo apt-get install 	libncurses5-dev \
			libgnome2-dev \
			libgnomeui-dev \
    			libgtk2.0-dev \
			libatk1.0-dev \
			libbonoboui2-dev \
    			libcairo2-dev \
			libx11-dev \
			libxpm-dev \
			libxt-dev \
			python-dev \
    			python3-dev \
			ruby-dev \
			lua5.1 \
			lua5.1-dev \
			libperl-dev \
    			tmux \
			zsh \
			htop \
			tree \
			git \

sudo apt-get remove 	vim \
			vim-runtime \
			gvim \
			vim-tiny \
			vim-common \
			vim-gui-common \
			vim-nox\

cd ~

git clone https://github.com/vim/vim.git .vim/

cd .vim

./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr

make VIMRUNTIMEDIR=/usr/share/vim/vim80

cd ~/.vim

sudo make install

# Create the file type plugin folder.
mkdir ~/.vim/ftplugin/
cp .myconfig/ftplugin/* ~/.vim/ftplugin/

# Create the colors folder.
mkdir ~/.vim/colors/
cp .myconfig/mushroom.vim ~/.vim/colors/

# Create the folders for the plugin packages.
mkdir ~/.vim/pack/
mkdir ~/.vim/pack/my-plugins/
mkdir ~/.vim/pack/my-plugins/start/
cd ~/.vim/pack/my-plugins/start/

# Clone the plugins from github.
git clone https://github.com/raimondi/delimitmate
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/tpope/vim-surround
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/tpope/vim-repeat
