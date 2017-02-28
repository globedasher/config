#!/bin/bash

# TODO: Can/should I run this as root and avoid the sudo calls?

# TODO: Maybe I should add a section to ensure the non-free repos for debian
# are added so I don't have to do that manually.

# MongoDB Repo Addition
# This adds the key to insert the mongodb repo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
# Create the file with the mongodb repo
echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

# Update! 
echo "sudo apt-get update"
sudo apt-get update

# Remove all unneeded versions of vim...
sudo apt-get remove -y 	vim \
			vim-runtime \
			gvim \
			vim-tiny \
			vim-common \
			vim-gui-common \
			vim-nox \


# I split the following installs into seperate lines for organization sake.
# Install my applications.
echo "Install applications."
sudo apt-get install -y	firefox-esr\
			tmux \
			xorg \
			xmonad \
			stterm \
			suckless-tools \
			zsh \
			htop \
			tree \
			git \
			gimp \
			irssi \
			ufw \

# Basic config of the ufw firewall
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Change shell to use zsh
sudo chsh -s `which zsh`

# The following items are for audio.
echo "Install audio tools."
sudo apt-get install -y alsa-tools \
			alsa-utils \

# The following items are for connectivity.
echo "Install connectivity tools."
sudo apt-get install -y connman \
			rfkill \
			dhcpcd5 \

# For the broadcom BCM43142  wifi on my laptop. The non-free debian repos must
# be enabled.
echo "Install laptop wifi driver."
sudo apt-get install -y broadcom-sta-dkms \

# Required for the Vim buid that occurs below.
echo "Install dev tools."
sudo apt-get install -y	mongodb-org \
			python-dev \
    			python3-dev \
			ruby-dev \
			lua5.1 \
			lua5.1-dev \
			libperl-dev \
			libncurses5-dev \
			libgnome2-dev \
			libgnomeui-dev \
    			libgtk2.0-dev \
			libatk1.0-dev \
			libbonoboui2-dev \
    			libcairo2-dev \
			libx11-dev \
			libxpm-dev \
			libxt-dev \

# Other development modules
sudo apt-get install -y npm \

# Install nodejs, bower and nodemon.
sudo npm install -g nodejs bower nodemon

# Create the missing Debian symlink.
sudo ln -s /usr/bin/nodejs /usr/bin/node

# Install VIM
# Change to home directory and clone the vim repository
cd ~
git clone https://github.com/vim/vim.git .vim/

# Change into the vim directory and compile the application.
cd ~/.vim
echo "Configure Vim."
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
	    --enable-cscope \
	    --prefix=/usr \

make VIMRUNTIMEDIR=/usr/share/vim/vim80
sudo make install


# Post install config for Vim
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
