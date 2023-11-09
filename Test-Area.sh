#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Wed Nov 08 2023 - 07:19
#  Last Mod: Thu Nov 09 2023 - 05:48
#  Config:
#  Depends:
#  Note:
#!/bin/bash
Storage="$HOME/Git/Welcome/storage.txt"

ETHER=$(grep "ETHER" $Storage | cut -d= -f2)
WIFI=$(grep "WIFI" $Storage | cut -d= -f2)
#
### From Stats.sh
#cpu_idle="$(sar -u 1 1 | grep "Av" | awk '{print $NF}')"; echo "cpu_idle=$cpu_idle" >> $Storage
#netz_d="$(grep "D" ~/.local/tmp/NETSPEED.txt | awk '{print $2}')"; echo "netz_d=$netz_d" >> $Storage
#netz_u="$(grep "U" ~/.local/tmp/NETSPEED.txt | awk '{print $2}')"; echo "netz_u=$netz_u" >> $Storage
#ssh_connections=$(ss -t -n | awk '$1 == "ESTAB" && ($NF ~ /:22$/ || $4 ~ /:22$/) {print $5}' | cut -d: -f1 | sort -u); echo "ssh_connections=$ssh_connections" >> $Storage
#ssh_count=$( echo $ssh_connections | wc -l); echo "ssh_count=$ssh_count" >> $Storage
#tmux_count=$(tmux ls | wc -l); echo "tmux_count=$tmux_count" >> $Storage
#rdisk_usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%'); echo "rdisk_usage=$rdisk_usage" >> $Storage
#Ddisk_usage=$(df $HOME/mnt/DataT | awk 'NR==2 {print $5}' | tr -d '%'); echo "Ddisk_usage=$Ddisk_usage" >> $Storage
#udisk_usage=$(df $HOME/mnt/USB | awk 'NR==2 {print $5}' | tr -d '%'); echo "udisk_usage=$udisk_usage" >> $Storage
#jdisk_usage=$(df $HOME/mnt/Jenny | awk 'NR==2 {print $5}' | tr -d '%'); echo "jdisk_usage=$jdisk_usage" >> $Storage

echo "$ETHER"
echo "$WIFI"
























#

