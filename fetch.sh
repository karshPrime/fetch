#!/bin/bash

clear

format_uptime() {
  uptime -p | sed -e 's/up //'
}

echo ""
echo -e "                   󰣇  Machine \e[1;30m$(uname -r | cut -c1-8)"
echo -e "                   \e[1;32m├─   CPU     : \e[0;37mi7-9750H \e[1;30m2.60GHz"
echo -e "\e[39m |-|    \e[32m*          \e[1;33m├─ 󰈐  GPU     : \e[0;37mGeForce GTX 1650"
echo -e "\e[39m |-|   _    \e[33m*  \e[39m__  \e[31m├─   Charge  : \e[0;37m$(cat /sys/class/power_supply/BAT1/capacity)%"
echo -e "\e[39m |-|   |  \e[31m*    \e[39m|/' \e[95m├─   Pkgs    : \e[0;37m$(pacman -Qq | wc -l)"
echo -e "\e[39m |-|   |~*~~~o~|   \e[34m├─   Storage : \e[0;37m$(df -h | grep '/$' | awk '{print $3" / "$2" ["$5"]"}')"
echo -e "\e[39m |-|   |  O o *|   \e[36m├─   Memory  : \e[0;37m$(free -m | grep Mem | awk '{print $3"MiB / "$2"MiB" }')"
echo -e "\e[39m/___\  |o___O__|   \e[1;31m├─   Uptime  : \e[0;37m$(format_uptime)"
echo -e "                    \e[39m \e[32m \e[33m \e[95m \e[34m \e[36m \e[31m \e[37m"
echo ""
