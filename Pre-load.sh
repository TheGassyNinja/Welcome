#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Thu Nov 09 2023 - 01:48
#  Last Mod: Mon Nov 20 2023 - 02:41
#  Config:
#  Depends: sysstat (sar for CPU use)
#  Note:

######### Colors:
#
#  Palette: https://www.color-hex.com/color-palette/471 
# #00aedb	(0,174,219)
# #a200ff	(162,0,255)
# #f47835	(244,120,53)
# #d41243	(212,18,67)
# #8ec127	(142,193,39)
#
#  		https://www.color-hex.com/color-palette/8898
# #00ff00	(0,255,0)
# #ff0000	(255,0,0)
# #007b7b	(0,123,123)
# #fa9c06	(250,156,6)
# #292929	(41,41,41)
#
####################

#!/bin/bash
Storage="$HOME/.local/tmp/Storage.txt"
echo "DATE=$(date +%R)" > $Storage 
#
## From Welcome.v0.3
PING=$(ping -c 1 google.com); echo "PING=$PING" >> $Storage 
DNS=$(nslookup google.com | grep "google.com" | wc -l); echo "DNS=$DNS" >> $Storage
ETHER=$(nmcli connection | grep "eno" | awk '{print $NF}'); echo "ETHER=$ETHER" >> $Storage 
WIFI=$(nmcli connection | grep "wlo1" | awk '{print $NF}'); echo "WIFI=$WIFI" >> $Storage 
#
## From Stats.sh
cpu_idle="$(sar -u 1 1 | grep "Av" | awk '{print $NF}')"; echo "cpu_idle=$cpu_idle" >> $Storage
netz_d="$(grep "D" ~/.local/tmp/NETSPEED.txt | awk '{print $2}')"; echo "netz_d=$netz_d" >> $Storage
netz_u="$(grep "U" ~/.local/tmp/NETSPEED.txt | awk '{print $2}')"; echo "netz_u=$netz_u" >> $Storage

ssh_connections=$(ss -t -n | awk '$1 == "ESTAB" && ($NF ~ /:22$/ || $4 ~ /:22$/) {print $5}' | cut -d: -f1 | sort -u); echo "ssh_connections=$ssh_connections" >> $Storage

ssh_count=$( echo $ssh_connections | wc -l); echo "ssh_count=$ssh_count" >> $Storage
tmux_count=$(tmux ls | wc -l); echo "tmux_count=$tmux_count" >> $Storage

rdisk=$(df -hBG / | grep "/" | awk '{gsub(/[A-Za-z]/, "", $2); gsub(/[A-Za-z]/, "", $3); print $5, $2, $3}' | tr -d '%'); echo "rdisk=$rdisk" >> $Storage
rdisk_usage=$(echo "$rdisk" | awk '{print $1}'); echo "rdisk_usage=$rdisk_usage" >> $Storage
rdisk_size=$(echo "$rdisk" | awk '{print $2}'); echo "rdisk_size=$rdisk_size" >> $Storage
rdisk_use=$(echo "$rdisk" | awk '{print $3}'); echo "rdisk_use=$rdisk_use" >> $Storage

Ddisk=$(df -hBG $HOME/mnt/DataT | grep "DataT" | awk '{gsub(/[A-Za-z]/, "", $2); gsub(/[A-Za-z]/, "", $3); print $5, $2, $3}' | tr -d '%'); echo "Ddisk=$Ddisk" >> $Storage
Ddisk_usage=$(echo "$Ddisk" | awk '{print $1}'); echo "Ddisk_usage=$Ddisk_usage" >> $Storage
Ddisk_size=$(echo "$Ddisk" | awk '{print $2}'); echo "Ddisk_size=$Ddisk_size" >> $Storage
Ddisk_use=$(echo "$Ddisk" | awk '{print $3}'); echo "Ddisk_use=$Ddisk_use" >> $Storage

jdisk=$(df -hBG $HOME/mnt/Jenny | grep "Jenny" | awk '{gsub(/[A-Za-z]/, "", $2); gsub(/[A-Za-z]/, "", $3); print $5, $2, $3}' | tr -d '%'); echo "jdisk=$jdisk" >> $Storage
jdisk_usage=$(echo "$jdisk" | awk '{print $1}'); echo "jdisk_usage=$jdisk_usage" >> $Storage
jdisk_size=$(echo "$jdisk" | awk '{print $2}'); echo "jdisk_size=$jdisk_size" >> $Storage
jdisk_use=$(echo "$jdisk" | awk '{print $3}'); echo "jdisk_use=$jdisk_use" >> $Storage


#udisk=$(df -hBG $HOME/mnt/Jenny | grep "Jenny" | awk '{gsub(/[A-Za-z]/, "", $2); gsub(/[A-Za-z]/, "", $3); print $5, $2, $3}' | tr -d '%'); echo "udisk=$udisk" >> $Storage
#udisk_usage=$(echo "$udisk" | awk '{print $1}'); echo "udisk_usage=$udisk_usage" >> $Storage
#udisk_size=$(echo "$udisk" | awk '{print $2}'); echo "udisk_size=$udisk_size" >> $Storage
#udisk_use=$(echo "$udisk" | awk '{print $3}'); echo "udisk_use=$udisk_use" >> $Storage
#
#
#echo "Run Welcome...sh here"
/home/thegassyninja/Git/Welcome/Welcome.v0.5.sh &
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#

