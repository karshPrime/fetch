#!/usr/bin/env bash

# terminal system info script

# information to display
STORAGE=$(df -h | grep nvme0n1p3 | awk '{print $3"/"$2" ["$5"]"}')
MEMORY=$(free -m | grep Mem | awk '{print $3"MiB / "$2"MiB" }')
PACKAGES=$(pacman -Qq | wc -l)
SELECTED=$(( RANDOM % 34 * 6 ))
CHARGE=$(cat /sys/class/power_supply/BAT1/capacity)
INDEX=0

# Uptime
if [ $(uptime -p | wc -w) == '3' ]; then
	UPTIME=$(uptime -p | awk '{print $2,"mins"}')
else
	UPTIME=$(uptime -p | awk '{print $2"hr(s) "$4"mins "}')
fi

clear

while IFS= read -r line
do
  if [ $INDEX -eq $(( SELECTED + 1 )) ]; then
    echo -e "\e[36m$line \e[31m $USER@$HOST [$CHARGE%]"
  elif [ $INDEX -eq $(( SELECTED + 2 )) ]; then
    echo -e "\e[36m$line \e[35m Uptime......: \e[37m$UPTIME"
  elif [ $INDEX -eq $(( SELECTED + 3 )) ]; then
    echo -e "\e[36m$line \e[33m Packages:...: \e[37m$PACKAGES"
  elif [ $INDEX -eq $(( SELECTED + 4 )) ]; then
    echo -e "\e[36m$line \e[34m Disk........: \e[37m$STORAGE"
  elif [ $INDEX -eq $(( SELECTED + 5 )) ]; then
    echo -e "\e[36m$line \e[32m Memory......: \e[37m$MEMORY"
  fi
  ((INDEX = INDEX + 1))
done < $HOME/Dev/fetch/icons.txt
