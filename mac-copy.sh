#!/bin/bash

# Ask for the administrator password upfront
sudo -v


# Bash
sudo mkdir /etc/profile.d
sudo cp ./bash.bashrc.local /etc/
sudo cp ./profile.d/bash-prompt-color.sh /etc/profile.d/
grep -q "bash.bashrc.local" /var/root/.bashrc || echo 'source /etc/bash.bashrc.local' >> /var/root/bashrc
grep -q "bash.bashrc.local" /etc/bashrc || echo 'source /etc/bash.bashrc.local' >> /etc/bashrc

# Git
gitfolder=/Library/Developer/CommandLineTools/usr
cp ./gitconfig /etc/gitconfig
mkdir -p $gitconfig/etc
ln -s /etc/gitconfig $gitfolder/etc/gitconfig

# vim
sudo cp -r ./vimfiles /usr/local/share/vim/
sudo cp ./vimrc.local /usr/local/share/vim/vimrc.local
sudo ln -s vimrc.local /usr/local/share/vim/vimrc  # or use "source ./vimrc.local"

