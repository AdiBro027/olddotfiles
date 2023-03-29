#!/bin/bash

#dmenu
# bssid=$(nmcli device wifi list | sed -n '1!p' | cut -b 9- | dmenu -p "Select Wifi: " -l 20 -fn JetBrainsMonoNerdFont -nb "#101010" -nf "#ffffff" -sb "#b4b4b4" -sf "#000000"| cut -d ' ' -f1)
# pass=$(echo "" | dmenu -p "Enter password: " -fn JetBrainsMonoNerdFont -nb "#101010" -nf "#ffffff" -sb "#b4b4b4" -sf "#000000")

#rofi
bssid=$(nmcli device wifi list | sed -n '1!p' | rofi -dmenu -i -p "Select Wifi:" -no-custom -scroll-method 1 -font "jetbrainsmononerdfont 11" | awk '{print $1}')
pass=$(rofi -dmenu -i -p "Enter Password:" -font "JetBrainsMonoNerdFont 11" -password< /dev/null)

nmcli device wifi connect $bssid password $pass
