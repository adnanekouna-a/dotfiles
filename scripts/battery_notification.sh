#!bin/bash

# adnanekouna-a/dotfiles

# A script to show a notification with the battery level
# Last Updated : 21/04/2022

capacity=$(cat /sys/class/power_supply/"BAT0"/capacity)

if [ $capacity -lt 20 ]
then
	dunstify "Battery Level:" "$capacity%" -u critical
else
	dunstify "Battery Level:" "$capacity%" -u low
fi
