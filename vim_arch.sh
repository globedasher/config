#!/bin/sh

# Post install config for Vim
# Create the file type plugin folder.
mkdir ~/.vim/
mkdir ~/.vim/ftplugin/
cp ~/.myconfig/ftplugin/* ~/.vim/ftplugin/

# Create the colors folder.
mkdir ~/.vim/colors/
cp ~/.myconfig/mushroom.vim ~/.vim/colors/

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
