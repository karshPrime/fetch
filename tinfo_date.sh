#!/usr/bin/env bash

# terminal system info script

# information to display
KERNEL=$(uname -r)
UPTIME=$(uptime -p | awk '{print $2"hrs "$4"mins "}')
STORAGE=$(df -h | grep /dev/nvme0n1p3 | awk '{print $3"/"$2" ["$5"]"}')
MEMORY=$(free -m | grep Mem | awk '{print $3"MiB / "$2"MiB" }')
PACKAGES=$(pacman -Qq | wc -l)

clear

echo -e " \e[39m$(cal | awk 'NR==1')   \e[39mlexx@machine"
echo -e " \e[39m$(cal | awk 'NR==2')   \e[31m OS.........: \e[37mArch Linux"
echo -e " \e[39m$(cal | awk 'NR==3')   \e[32m Kernel.....: \e[37m$KERNEL"
echo -e " \e[39m$(cal | awk 'NR==4')   \e[33m Uptime.....: \e[37m$UPTIME"
echo -e " \e[39m$(cal | awk 'NR==5')   \e[34m Disk.......: \e[37m$STORAGE"
echo -e " \e[39m$(cal | awk 'NR==6')   \e[35m Memory.....: \e[37m$MEMORY"
echo -e " \e[39m$(cal | awk 'NR==7')   \e[31m Packages...: \e[37m$PACKAGES"
