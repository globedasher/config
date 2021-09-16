#!/bin/sh

# Post install config for Vim
# Create the file type plugin folder.
mkdir -p ~/.vim/ftplugin/
cp -r ./ftplugin/* ~/.vim/ftplugin

# Create the colors folder.
mkdir -p ~/.vim/colors/
cp -r ./colors/* ~/.vim/colors

# Create the folders for the plugin packages.
mkdir -p ~/.vim/pack/my-plugins/start/
cd ~/.vim/pack/my-plugins/start/

# Clone the plugins from github.
git clone https://github.com/raimondi/delimitmate
# git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/tpope/vim-surround
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/tpope/vim-repeat
