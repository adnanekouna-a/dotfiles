#!/bin/bash

# adnanekouna-a/dotfiles

# A script to sync my dotfiles
# Last Updated : 21/04/2022

cp -f ~/.prettierrc .
cp -f ~/.pylintrc .
cp -f ~/.vimrc vim/
cp -f ~/.bashrc bash/
cp -f ~/.bash_aliases bash/
cp -f ~/.bash_functions bash/
cp -f ~/.bash_profile bash/
cp -rf ~/.config/dunst/ .
cp -rf ~/.config/openbox/ .
cp -rf ~/.config/redshift/ .
cp -rf ~/.scripts/* scripts/
