#!/bin/sh

# Install packages
sudo pacman -S tmux \
    firefox \
    neovim \
    ranger \
    nmap \
    fish \
    proton-vpn-gtk-app \
    otf-font-awesome \
    powerline \
    powerline-fonts \
    hyprlock \
    hypridle \
    base-devel \

gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

# Copy the local config files
cp -a ./nvim/ ~/.config/
cp -a ./hypr/ ~/.config/
cp -a ./tmux/ ~/.config/
cp -a ./waybar/ ~/.config/

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
