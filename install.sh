#!/usr/bin/env bash
# install.sh - a script to make any shell nice and cozy

# Copyright (C) 2024 JAlexLong
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

VERSION=0.1.4

# import list of tools to install
source TOOLS

# import custom banner
source BANNER

echo $BANNER
echo '--------------------------------------------------'
echo ' Welcome to my super cozy install script! (>^-^)>' 
echo '--------------------------------------------------'
echo -n 'Install the terminal junkie starter pack?™ (Y/n): ' 
read confirm 
if [[ $confirm == [Nn]* ]]; then
    exit 1
fi
# install apt utils
sudo apt -y update && 
sudo apt -y upgrade 
#sudo apt -y install $APT_UTILS
# install flatpak
# install flatpak apps
# download binaries from github
# download source code from github
# build binaries from source

# Clone dotfiles from repo

echo -n "Pull debi-licious dotfiles and configs from GitHub? (y/N): " 
read confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    # check if .dotfiles exists
    if [[ -d "$HOME/.dotfiles" ]]; then
        echo 'The directory "~/.dotfiles/" already exists.'
        echo 'Would you like to delete the existing .dotfiles directory? [y/N]'
        read confirm

    fi
    git clone https://github.com/jalexlong/.dotfiles.git $HOME ||
        echo 'Could not pull dotfiles. Check your connection.' &&
        exit 1
fi

# Stow dotfiles
echo '----------------------------'
echo '      !!! WARNING !!!'
echo '----------------------------'
echo 'Continuing will overwrite any conflicting config files and assumes you'
echo 'are running this on a fresh install of one of the supported'
echo 'operating systems.'
echo
echo '- Debian 12'
echo
echo 'This action is PERMANENT and CANNOT BE UNDONE.'
echo -n 'Continue? (y/N): '
read confirm 
if [[ $confirm == [yY]* ]]; then
    echo "Let's get to stowin'"
    # for loop here instead
    stow bash git tmux zsh
fi
