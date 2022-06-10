#!/usr/bin/env bash

# information to display
STORAGE=$(df -h | grep nvme0n1p3 | awk '{print $3"/"$2" ["$5"]"}')
MEMORY=$(free -m | grep Mem | awk '{print $3"MiB / "$2"MiB" }')
PACKAGES=$(pacman -Qq | wc -l)
BATTERY=$(cat /sys/class/power_supply/BAT1/capacity)
SEP='•'
# Uptime
if [ $(uptime -p | wc -w) == '3' ]; then
	UPTIME=$(uptime -p | awk '{print $2,"mins"}')
else
	UPTIME=$(uptime -p | awk '{print $2"hr(s) "$4"mins "}')
fi

echo -e "\e[35m Uptime: \e[39m$UPTIME \e[36m$SEP \
\e[31m  Charge: \e[39m$BATTERY% \e[36m$SEP \
\e[33m Pkgs: \e[39m$PACKAGES \e[36m$SEP \
\e[34m Mem: \e[39m$MEMORY \e[36m$SEP \
\e[32m Disk: \e[39m$STORAGE"
