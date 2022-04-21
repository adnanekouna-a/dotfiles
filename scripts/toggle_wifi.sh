#!/bin/bash

# adnanekouna-a/dotfiles
#
# A script to toggle Wi-Fi status off and on.
# Last Updated : 18/04/2022

nmcli radio wifi `nmcli r wifi | grep enabled -c | sed -e "s/1/off/" | sed -e "s/0/on/"`
