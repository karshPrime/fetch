#!/usr/bin/env/ bash

# information to display
STORAGE=$(df -h | grep n1p2 | awk '{print $3"/"$2" ["$5"]"}')
MEMORY=$(free -m | grep Mem | awk '{print $3"MiB/"$2"MiB" }')
PACKAGES=$(pacman -Qq | wc -l)
BATTERY=$(cat /sys/class/power_supply/BAT1/capacity)
UPTIME=$(uptime | awk '{print $3}' | sed 's/,//')
SEP='•'

echo -e "\e[31m  Uptime: \e[39m$UPTIME \e[36m$SEP \
\e[35m  Charge: \e[39m$BATTERY% \e[36m$SEP \
\e[33m  Pkgs: \e[39m$PACKAGES \e[36m$SEP \
\e[34m  Mem: \e[39m$MEMORY \e[36m$SEP \
\e[32m  Disk: \e[39m$STORAGE"

echo ""
echo ""
