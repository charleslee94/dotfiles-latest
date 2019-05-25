#!/bin/bash

# Install git and zsh
sudo apt-get install git zsh

# Make zsh default shell
chsh -s /bin/zsh

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install vim
sudo apt-get install vim

# symlink dotfliles
ln -sv .?* ~;
