#!/usr/bin/env/ bash

# information to display
SEP='•'
STORAGE=$(df -h | grep n1p2 | awk '{print $3"/"$2" ["$5"]"}')
MEMORY=$(free -m | grep Mem | awk '{print $3"MiB/"$2"MiB" }')
PACKAGES=$(pacman -Qq | wc -l)
BATTERY=$(cat /sys/class/power_supply/BAT1/capacity)
UPTIME=$(
    uptime | awk -F'( |,|:)+' '{
    d=h=m=0;
    if ($7=="min") m=$6;
    else {
	if ($7~/^day/) {
            d=$6;
	    h=$8;
	    m=$9
	}
        else {
	    h=$6;
	    m=$7
        }
    }
    printf "%d-%02d:%02d\n", d+0, h+0, m+0
    }' | tr -d ' '
)

echo -e "\e[31m  Uptime: \e[39m$UPTIME \e[36m$SEP \
\e[35m  Charge: \e[39m$BATTERY% \e[36m$SEP \
\e[33m  Pkgs: \e[39m$PACKAGES \e[36m$SEP \
\e[34m  Mem: \e[39m$MEMORY \e[36m$SEP \
\e[32m  Disk: \e[39m$STORAGE"

echo ""
echo ""
