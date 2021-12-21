#!/usr/bin/env bash

# information to display
KERNEL=$(uname -r)
STORAGE=$(df -h | grep home | awk '{print $3"/"$2" ["$5"]"}')
MEMORY=$(free -m | grep Mem | awk '{print $3"MiB / "$2"MiB" }')

# Uptime
if [ $(uptime -p | wc -w) == '3' ]; then
	UPTIME=$(uptime -p | awk '{print $2,"mins"}')
else
	UPTIME=$(uptime -p | awk '{print $2"hr(s) "$4"mins "}')
fi

echo -e "\e[36m$line\e[32m Kernel: \e[37m$KERNEL \e[36m$line \e[33m Uptime: \e[37m$UPTIME \e[36m$line \e[34m Disk: \e[37m$STORAGE \e[36m$line \e[35m Memory: \e[37m$MEMORY"

