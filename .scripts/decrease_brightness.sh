#!/bin/bash

# adnanekouna-a/dotfiles
#
# A script to decrease brightness safely, it stops decreasing if the screen is gonna turn black.
# Last Updated : 18/04/2022

if (($(cat /sys/class/backlight/intel_backlight/actual_brightness) > 50)); then xbacklight -dec 5 ;fi
