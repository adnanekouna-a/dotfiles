#!/bin/bash

# adnanekouna-a/dotfiles

# A script to be executed when the battery level is below 5%
# Last Updated : 21/04/2022


# Checks whether the laptop is plugged or not
is_plugged=$(acpi -a | cut -d' ' -f3 | cut -d- -f1)

# Displays a notification
dunstify "Critical Battery Level" "The system is going to sleep-mode in 20 seconds!" -u critical
sleep 20s

# Hibernate the laptop if not plugged
if [ "$is_plugged" != "on" ]; then
	systemctl suspend
fi
