#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Tue Nov 07 2023 - 08:38
#  Last Mod: Thu Nov 09 2023 - 03:21
#  Config: Stats.v.0.1.sh
#  Depends: bc; 
#  Note:
#
#
#
#
#
###########################################################
#!/bin/bash
clear

echo ""
cpu_idle="$(sar -u 1 1 | grep "Av" | awk '{print $NF}')"
netz_d="$(grep "D" ~/.local/tmp/NETSPEED.txt | awk '{print $2}')"
netz_u="$(grep "U" ~/.local/tmp/NETSPEED.txt | awk '{print $2}')"
ssh_connections=$(ss -t -n | awk '$1 == "ESTAB" && ($NF ~ /:22$/ || $4 ~ /:22$/) {print $5}' | cut -d: -f1 | sort -u)
ssh_count=$( echo $ssh_connections | wc -l)
tmux_count=$(tmux ls | wc -l)
rdisk_usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
Ddisk_usage=$(df $HOME/mnt/DataT | awk 'NR==2 {print $5}' | tr -d '%')
udisk_usage=$(df $HOME/mnt/USB | awk 'NR==2 {print $5}' | tr -d '%')
jdisk_usage=$(df $HOME/mnt/Jenny | awk 'NR==2 {print $5}' | tr -d '%')

if [[ $cpu_idle =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    cpu_use=$(echo "100 - $cpu_idle" | bc -l)
fi

# df @ /
filled_blocks=$((($rdisk_usage * 13) / 100))
empty_blocks=$((13 - $filled_blocks))

rbar=""
for ((i = 1; i <= filled_blocks; i++)); do
    rbar+="▓"
done
for ((i = 1; i <= empty_blocks; i++)); do
    rbar+="░"
done
rbar+=""

# df @ ~/mnt/DataT (NFS Mount)
filled_blocks=$((($Ddisk_usage * 50) / 100))
empty_blocks=$((50 - $filled_blocks))

Dbar=""
for ((i = 1; i <= filled_blocks; i++)); do
    Dbar+="▓"
done
for ((i = 1; i <= empty_blocks; i++)); do
    Dbar+="░"
done
Dbar+=""


# df @ ~/mnt/USB (NFS Mount)
filled_blocks=$((($udisk_usage * 50) / 100))
empty_blocks=$((50 - $filled_blocks))

ubar=""
for ((i = 1; i <= filled_blocks; i++)); do
    ubar+="▓"
done
for ((i = 1; i <= empty_blocks; i++)); do
    ubar+="░"
done
ubar+=""


# df @ ~/mnt/Jenny (NFS Mount)
filled_blocks=$((($jdisk_usage * 50) / 100))
empty_blocks=$((50 - $filled_blocks))

jbar=""
for ((i = 1; i <= filled_blocks; i++)); do
    jbar+="▓"
done
for ((i = 1; i <= empty_blocks; i++)); do
    jbar+="░"
done
jbar+=""

echo -e "  $(date +%R)                                                                                         $(inxi -B | grep "BAT0" | awk '{print$6}')"
echo -e "       [RAM: $(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d . -f 1)%]							            [CPU: $cpu_use%]"
echo -e "                 [Down: $netz_d Mb/s] 	SSH: <$ssh_count>   <>   Tmux: <$tmux_count>  [Up: $netz_u Mb/s] "
{
echo -e "                   _________________________________________________________________ "
echo -e "                   ----->   $USER@$HOSTNAME   : : :    192.168.254.131    <-----"
echo -e "                   _________________________________________________________________ "
} | lolcat -a -s 10
echo " "

echo -e "      [ / ]   $rbar [$rdisk_usage%]"
echo " "
echo -e "    [ DataT ] $Dbar [$Ddisk_usage%]"
echo " "
echo -e "    [  USB  ] $ubar [$udisk_usage%]"
echo " "
echo -e "    [ Jenny ] $jbar [$jdisk_usage%]"

echo " "
echo " "
echo " "
echo " "

# diskspace (Bars?)
# Wallpaper Name: 
# Theme info: Name
# 			Colors: 
#
#
#
# 5 Recent Aliases:
#
#
#

