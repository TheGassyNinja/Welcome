#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Mon Nov 13 2023 - 05:21
#  Last Mod: Mon Nov 13 2023 - 18:30
#  Config:
#  Depends:
#  Note:
#


#!/usr/bin/env sh

LongStorage="$HOME/.local/tmp/LongStorage.txt"
echo "#         Long Run @  [ $(date +%R)" > $LongStorage
PacU=$(checkupdates | wc -l); echo "PacU=$PacU" >> $LongStorage
YayU=$(yay -Qm | wc -l); echo "YayU=$YayU" >> $LongStorage
speedz=$(speedtest-cli --simple --secure); result=$(echo "$speedz" | tr '\n' ' : '); result=${result%:}; echo "speedz='$result'" >> $LongStorage
rdisk=$(df -hBG / | grep "/" | awk '{gsub(/[A-Za-z]/, "", $2); gsub(/[A-Za-z]/, "", $3); print $5, $2, $3}' | tr -d '%'); echo "#rdisk=$rdisk" >> $LongStorage
rdisk_usage=$(echo "$rdisk" | awk '{print $1}'); echo "rdisk_usage=$rdisk_usage" >> $LongStorage
rdisk_size=$(echo "$rdisk" | awk '{print $2}'); echo "rdisk_size=$rdisk_size" >> $LongStorage
rdisk_use=$(echo "$rdisk" | awk '{print $3}'); echo "rdisk_use=$rdisk_use" >> $LongStorage
Ddisk=$(df -hBG $HOME/mnt/DataT | grep "DataT" | awk '{gsub(/[A-Za-z]/, "", $2); gsub(/[A-Za-z]/, "", $3); print $5, $2, $3}' | tr -d '%'); echo "#Ddisk=$Ddisk" >> $LongStorage
Ddisk_usage=$(echo "$Ddisk" | awk '{print $1}'); echo "Ddisk_usage=$Ddisk_usage" >> $LongStorage
Ddisk_size=$(echo "$Ddisk" | awk '{print $2}'); echo "Ddisk_size=$Ddisk_size" >> $LongStorage
Ddisk_use=$(echo "$Ddisk" | awk '{print $3}'); echo "Ddisk_use=$Ddisk_use" >> $LongStorage
jdisk=$(df -hBG $HOME/mnt/Jenny | grep "Jenny" | awk '{gsub(/[A-Za-z]/, "", $2); gsub(/[A-Za-z]/, "", $3); print $5, $2, $3}' | tr -d '%'); echo "#jdisk=$jdisk" >> $LongStorage
jdisk_usage=$(echo "$jdisk" | awk '{print $1}'); echo "jdisk_usage=$jdisk_usage" >> $LongStorage
jdisk_size=$(echo "$jdisk" | awk '{print $2}'); echo "jdisk_size=$jdisk_size" >> $LongStorage
jdisk_use=$(echo "$jdisk" | awk '{print $3}'); echo "jdisk_use=$jdisk_use" >> $LongStorage
#echo "        # USB Drive" >> $LongStorage 
#udisk=$(df -hBG $HOME/mnt/USB | grep "USB" | awk '{gsub(/[A-Za-z]/, "", $2); gsub(/[A-Za-z]/, "", $3); print $5, $2, $3}' | tr -d '%'); echo "#udisk=$udisk" >> $LongStorage
#udisk_usage=$(echo "$udisk" | awk '{print $1}'); echo "udisk_usage=$udisk_usage" >> $LongStorage
#udisk_size=$(echo "$udisk" | awk '{print $2}'); echo "udisk_size=$udisk_size" >> $LongStorage
#udisk_use=$(echo "$udisk" | awk '{print $3}'); echo "udisk_use=$udisk_use" >> $LongStorage


