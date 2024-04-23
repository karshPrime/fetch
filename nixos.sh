clear

TODO=$(cat ~/Desktop/karsh.todo | wc -l)

echo ""
echo -e "\e[1;36m  \\\\\  \\\\\\ //     \e[37m󱄅  $USERNAME@$HOSTNAME \e[1;30m$(uname -r) \e[33m[$TODO]"
echo -e "\e[1;36m ==\\\\\\__\\\\\\/ //   \e[1;32m├─   CPU     : \e[0;37mi7-9750H @ 2.60GHz"
echo -e "\e[1;36m   //   \\\\\\//    \e[1;33m├─ 󰈐  GPU     : \e[0;37mGeForce GTX 1650"
echo -e "\e[1;36m==//     //==   \e[1;34m├─   Storage : \e[0;37m$(df -h | grep '/$' | awk '{print $3" / "$2" ["$5"]"}')"
echo -e "\e[1;36m //\\\\\\___//      \e[1;36m├─   Memory  : \e[0;37m$(free -m | grep Mem | awk '{print $3"MiB / "$2"MiB" }')"
echo -e "\e[1;36m// /\\\\\\  \\\\\\==    \e[1;31m├─   Charge  : \e[0;37m$(cat /sys/class/power_supply/BAT1/capacity)%"
echo -e "\e[1;36m  // \\\\\\  \\\\\\      \e[1;39m \e[32m \e[33m \e[95m \e[34m \e[36m \e[31m \e[37m"
echo ""

# echo "We trust you have received the usual lecture from the local System"
# echo "Administrator. It usually boils down to these three things:"
# echo ""
# echo "      a) Respect the privacy of others."
# echo "      b) Think before you type."
# echo "      c) With great power comes great responsibility."
