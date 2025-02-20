#!/bin/sh

# Install packages
sudo apt-get install tmux \
    neovim \
    ranger \
    nmap \
    fish \

# Copy the local config files
cp -a ./nvim/ ~/.config/
cp -a ./tmux/ ~/.config/

# Create the folders for the plugin packages.
mkdir -p ~/.config/nvim/pack/my-plugins/start/
cd ~/.config/nvim/pack/my-plugins/start/

# Clone the plugins from github.
git clone https://github.com/raimondi/delimitmate
# git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/tpope/vim-surround
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/tpope/vim-repeat
