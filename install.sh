#!/bin/bash

# adnanekouna-a/dotfiles

# A script to install my dotfiles on another machine
# Last Updated : 21/04/2022

cp -f ~/Dotfiles/.prettierrc ~/
cp -f ~/Dotfiles/.pylintrc ~/
cp -f ~/Dotfiles/vim/vimrc ~/
cp -f ~/Dotfiles/bash/* ~/
cp -rf ~/Dotfiles/dunst/ ~/.config/
cp -rf ~/Dotfiles/openbox/ ~/.config/
cp -rf ~/Dotfiles/redshift/ ~/.config/
