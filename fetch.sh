#!/bin/bash

clear

format_uptime() {
  uptime -p | sed -e 's/up //'
}

CPU_MODEL=$(lscpu | grep 'Model name' | cut -d':' -f2 | sed 's/^ *//')
GPU_MODEL=$(lspci | grep -i 'VGA' | awk -F ' ' '{print $5" "$6" "$7" "$8" "$9}' | sed 's/^ *//')

echo ""
echo -e "                   󰣇  $HOSTNAME \e[1;30m$(uname -r)"
echo -e "                   \e[1;32m├─   CPU     : \e[0;37m$CPU_MODEL"
echo -e "\e[39m |-|    \e[32m*          \e[1;33m├─ 󰈐  GPU     : \e[0;37m$GPU_MODEL"
echo -e "\e[39m |-|   _    \e[33m*  \e[39m__  \e[31m├─   Charge  : \e[0;37m$(cat /sys/class/power_supply/BAT1/capacity)%"
echo -e "\e[39m |-|   |  \e[31m*    \e[39m|/' \e[95m├─   Pkgs    : \e[0;37m$(pacman -Qq | wc -l)"
echo -e "\e[39m |-|   |~*~~~o~|   \e[34m├─   Storage : \e[0;37m$(df -h | grep '/$' | awk '{print $3" / "$2" ["$5"]"}')"
echo -e "\e[39m |-|   |  O o *|   \e[36m├─   Memory  : \e[0;37m$(free -m | grep Mem | awk '{print $3"MiB / "$2"MiB" }')"
echo -e "\e[39m/___\  |o___O__|   \e[1;31m├─   Uptime  : \e[0;37m$(format_uptime)"
echo -e "                    \e[39m \e[32m \e[33m \e[95m \e[34m \e[36m \e[31m \e[37m"
echo ""
