#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Tue Nov 07 2023 - 08:38
#  Last Mod: Mon Nov 20 2023 - 03:16
#  Config: Stats.v.0.1.sh
#  Depends: bc; 
#  Note:
#
# (Macro for editing from OG)
# vwy 2w dt) i grep "esc"0pxi $Stor.... esc0j 
#
# cpu_idle="$(sar -u 1 1 | grep "Av" | awk '{print $NF}')
# cpu_idle="$(sar -u 1 1 | grep "Av" | awk '{print $NF}')
# cpu_idle=$(grep "cpu_idle" $Storage | cut -d= -f2)

#
###########################################################
#!/bin/bash

Storage="$HOME/.local/tmp/MasterStorage.txt"
clear

echo ""
cpu_idle=$(grep "cpu_idle" $Storage | cut -d= -f2)
netz_d=$(grep "netz_d" $Storage | cut -d= -f2)
netz_u=$(grep "netz_u" $Storage | cut -d= -f2)
ssh_connections=$(grep "ssh_connections" $Storage | cut -d= -f2)
ssh_count=$( grep "ssh_count" $Storage | cut -d= -f2)
tmux_count=$(grep "tmux_count" $Storage | cut -d= -f2)


rdisk_usage=$(grep "rdisk_usage" $Storage | cut -d= -f2)
rdisk_size=$(grep "rdisk_size" $Storage | cut -d= -f2)
rdisk_use=$(grep "rdisk_use" $Storage | cut -d= -f2)


Ddisk_usage=$(grep "Ddisk_usage" $Storage | cut -d= -f2)
Ddisk_size=$(grep "Ddisk_size" $Storage | cut -d= -f2)
Ddisk_use=$(grep "Ddisk_use" $Storage | cut -d= -f2)

#udisk_usage=$(grep "udisk_usage" $Storage | cut -d= -f2)
#udisk_size=$(grep "udisk_size" $Storage | cut -d= -f2)
#udisk_use=$(grep "udisk_use" $Storage | cut -d= -f2)

jdisk_usage=$(grep "jdisk_usage" $Storage | cut -d= -f2)
jdisk_size=$(grep "jdisk_size" $Storage | cut -d= -f2)
jdisk_use=$(grep "jdisk_use" $Storage | cut -d= -f2)



##
#
#
#
#
#####
##	#ff71ce	(255,113,206)
##	#01cdfe	(1,205,254)
##	#05ffa1	(5,255,161)
##	#b967ff	(185,103,255)
##	#fffb96	(255,251,150)
#
#
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


## df @ ~/mnt/USB (NFS Mount)
#filled_blocks=$((($udisk_usage * 50) / 100))
#empty_blocks=$((50 - $filled_blocks))
#
#ubar=""
#for ((i = 1; i <= filled_blocks; i++)); do
#    ubar+="▓"
#done
#for ((i = 1; i <= empty_blocks; i++)); do
#    ubar+="░"
#done
#ubar+=""


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


####
Pink='\e[38;2;255;113;206m' #	 #ff71ce	(255,113,206)
Blue='\e[38;2;1;205;254m'  #	 #01cdfe	(1,205,254)
Green='\e[38;2;5;255;161m' #	 #05ffa1	(5,255,161)
Purple='\e[38;2;185;103;255m' #	 #b967ff	(185,103,255)
Yellow='\e[38;2;255;251;150m' #	 #fffb96	(255,251,150)
close='\e[0m'
#
###


echo -e "${Yellow}  $(date +%R)                                                                                         $(inxi -B | grep "BAT0" | awk '{print$6}')${close}"
echo -e "${Blue}       [RAM: $(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d . -f 1)%]							            [CPU: $cpu_use%]${close}"
echo -e "${Yellow}                 [Down: $netz_d Mb/s]${close} 	${Purple}SSH: <$ssh_count>${close}  ${Yellow} <>${close}  ${Purple} Tmux: <$tmux_count>${close}  ${Yellow}[Up: $netz_u Mb/s]${close} "
{
echo -e "                   _________________________________________________________________ "
echo -e "                   ----->   $USER@$HOSTNAME   : : :    192.168.254.131    <-----"
echo -e "                   ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ "
} | lolcat -a -s 10

echo " "
echo " "
echo " "
echo " "
echo -e "${Yellow}      [${close}${Purple} /${close}${Yellow} ]${close}${Green}   $rbar${close}                                     ${Yellow} [${close}${Purple}$rdisk_usage${close}${Yellow}]${close}"
echo " "
echo -e "${Yellow}    [${close}${Purple} DataT${close}${Yellow} ]${close}${Green} $Dbar${close}${Yellow} [${close}${Purple}$Ddisk_usage${close}${Yellow}]${close}"
echo " "
echo -e "${Yellow}    [${close}${Purple} Jenny${close}${Yellow} ]${close}${Green} $jbar${close}${Yellow} [${close} ${Purple}$jdisk_usage${close}${Yellow}]${close}"
echo " "
#echo -e "${Yellow}    [${close}${Purple}  USB${close}${Yellow}  ]${close}${Green} $ubar${close}${Yellow} [${close}${Purple}$udisk_usage${close}${Yellow}]${close}"
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

