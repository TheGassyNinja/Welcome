#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Mon Nov 13 2023 - 01:45
#  Last Mod: Tue Nov 14 2023 - 03:39
#  Config:
#  Depends: sysstat (for sar cpu_idle) 
#  Note: MNTs - Cronie - 
#

#!/bin/bash
LongStorage="$HOME/.local/tmp/LongStorage.txt"
Storage="$HOME/.local/tmp/Storage.txt"
MasterStorage="$HOME/.local/tmp/MasterStorage.txt"
echo "#            Short Time: $(date +%R)" > $Storage 
PING=$(ping -c 1 google.com | grep "loss" | awk '{print $6}'); echo "PING='$PING Loss'" >> $Storage 
DNS=$(nslookup google.com | grep "google.com" | wc -l); echo "DNS=$DNS" >> $Storage
ETHER=$(nmcli connection | grep "eno" | awk '{print $NF}'); echo "ETHER=$ETHER" >> $Storage 
WIFI=$(nmcli connection | grep "wlo1" | awk '{print $NF}'); echo "WIFI=$WIFI" >> $Storage 
netz_d="$(grep "Down" $LongStorage | awk '{print $5 " " $6}')"; echo "netz_d='$netz_d'" >> $Storage
netz_u="$(grep "Upload" $LongStorage | awk '{print $8 " " $9}')"; echo "netz_u='$netz_u'" >> $Storage
cpu_idle="$(sar -u 1 1 | grep "Av" | awk '{print $NF}')"; echo "cpu_idle=$cpu_idle" >> $Storage
cpu_usage="$(awk -v idle="$cpu_idle" 'BEGIN { print 100 - idle }')"; echo "cpu_usage=$cpu_usage" >> $Storage
ram_use="$(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d . -f 1)"; echo "ram_use=$ram_use" >> $Storage
ssh_connections=$(ss -t -n | awk '$1 == "ESTAB" && ($NF ~ /:22$/ || $4 ~ /:22$/) {print $5}' | cut -d: -f1 | sort -u); result=$(echo "$ssh_connections" | tr '\n' ' : '); result=${result%:}; echo "ssh_connections='$result'" >> $Storage
ssh_count=$( echo $ssh_connections | wc -l); echo "ssh_count=$ssh_count" >> $Storage
tmux_count=$(tmux ls | wc -l); echo "tmux_count=$tmux_count" >> $Storage
cat $LongStorage > $MasterStorage
echo "" >> $MasterStorage 
echo " ####################### " >> $MasterStorage
echo "" >> $MasterStorage 
cat $Storage >> $MasterStorage
echo "" >> $MasterStorage 


#######################################################
