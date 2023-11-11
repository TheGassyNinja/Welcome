#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Wed Nov 08 2023 - 07:19
#  Last Mod: Fri Nov 10 2023 - 18:52
#  Config:
#  Depends:
#  Note:
#!/bin/bash
clear

Storage="$HOME/Git/Welcome/storage.txt"
echo "DATE=$(date +%R)" > $Storage 





Ddisk=$(df -hBG $HOME/mnt/DataT | grep "DataT" | awk '{gsub(/[A-Za-z]/, "", $2); gsub(/[A-Za-z]/, "", $3); print $5, $2, $3}'); echo "Ddisk=$Ddisk" >> $Storage
Ddisk_usage=$(echo "$Ddisk" | awk '{print $1}'); echo "Ddisk_usage=$Ddisk_usage" >> $Storage
Ddisk_size=$(echo "$Ddisk" | awk '{print $2}'); echo "Ddisk_size=$Ddisk_size" >> $Storage
Ddisk_use=$(echo "$Ddisk" | awk '{print $3}'); echo "Ddisk_use=$Ddisk_use" >> $Storage










#blue='\e[38;2;0;0;255m'
#close='\e[0m'
#echo -e "The word ${blue}BLUE${close} is blue."
#
########## Colors:
##
##  Palette: https://www.color-hex.com/color-palette/471 
## 	#00aedb	(0,174,219)
## 	#a200ff	(162,0,255)
## 	#f47835	(244,120,53)
## 	#d41243	(212,18,67)
## 	#8ec127	(142,193,39)
##
##
#####
## w 2dw xi\e[38;2; esc$x->m F,xi;esc F,xi;esc 
##
#Blue='\e[38;2;0;174;219m'
#Purple='\e[38;2;162;0;255m'
#Orange='\e[38;2;244;120;53m'
#Red='\e[38;2;212;18;67m'
#Green='\e[38;2;142;193;39m'
#close='\e[0m'
#
#echo -e " ${Blue}Blue${close}  ${Purple}Purple${close}  ${Orange}Orange${close}"
#echo " "
#echo " "
#echo " "
#echo "$df_output "
#echo " "
#echo " "
#echo " "
#
#
#rdisk_usage=$(grep "rdisk_usage" $Storage | cut -d= -f2)
#rdisk_prec=$(echo rdisk_usage | awk '{print $1}')
#rdisk_full=$(echo rdisk_usage | awk '{print $2}')
#rdisk_used=$(echo rdisk_usage | awk '{print $3}')
#
#
#
##
##echo "████████████████████████████████████████████"
##echo ""
##echo ""
##echo ""
##echo -e "\e[38;2;0;174;219m██████████\e[0m\e[38;2;162;0;255m   █████\e[0m\e[38;2;244;120;53m   ██████\e[0m\e[38;2;2121;18;67m   ████\e[0m\e[38;2;142;193;39m   ███████\e[0m"
##
##
##echo -e "██\e[38;2;0;174;219mLightest   \e[0m\e[38;2;162;0;255mLight   \e[0m\e[38;2;244;120;53mMiddle   \e[0m\e[38;2;212;18;67mDark   \e[0m\e[38;2;142;193;39mDarkest \e[0m "
##echo -e "██\e[38;2;162;0;255mLight   \e[0m\n██\e[38;2;244;120;53mMiddle   \e[0m\n██\e[38;2;212;18;67mDark   \e[0m\n██\e[38;2;142;193;39mDarkest \e[0m "
##
##
##echo ""
##echo ""
##echo ""
##
#
#
























#

