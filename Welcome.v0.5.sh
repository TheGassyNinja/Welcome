
#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Mon Nov 06 2023 - 07:19
#  Last Mod: Thu Nov 09 2023 - 06:59
#  Config: V0.3 Welcome.sh
#  Depends: Sudo (mounting) - nslookup - nmcli
#  Note: CLEAN UP! - Make Vars ([]) - Pac and Aur on own line. - Mount Section (Audio?) - Welcome (Audio?) 
#  IDEA: Run Stats.sh in (new terminal) afternet confirm section. (For effect) 
##################################################################################
#!bin/bash
Storage=$HOME/Git/Welcome/storage.txt

export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus export DISPLAY=:0;
if [ -r "$HOME/.dbus/Xdbus" ]; then
	. "$HOME/.dbus/Xdbus"
fi
# Set TERM to xterm-256color
export TERM=xterm-256color
mounted="$HOME/.config/bspwm/Scripts/all-remote-drives-have-been-mounted.mp3"
#PING=$(ping -c 1 google.com) 
#DNS=$(nslookup google.com | grep "google.com" | wc -l)
ETHER=$(grep "ETHER" $Storage | cut -d= -f2)
WIFI=$(grep "WIFI" $Storage | cut -d= -f2)

ETHER=$(nmcli connection | grep "eno" | awk '{print $NF}') 
WIFI=$(nmcli connection | grep "wlo1" | awk '{print $NF}') 
sudo mount -t nfs -o vers=4 192.168.254.169:/srv/nfs/DataT ~/mnt/DataT
sudo mount -t nfs -o vers=4 192.168.254.169:/srv/nfs/Jenny ~/mnt/Jenny 
check_ether () {
	if [[ $ETHER = "" ]]; then
		echo -e "    \e[38;2;34;160;182m HARDLINE: \033[0m   \033[38;5;196m  [NEGATIVE!!]\033[0m"
	else
		echo -e "    \e[38;2;34;160;182m HARDLINE: \033[0m   \e[38;2;0;255;159m  [Connected]\033[0m"
	fi	
}
check_wifi () {
	if [[ $WIFI = "" ]]; then
		echo -e "\e[38;2;254;255;110m Nacho-Wifi\e[0m \e\033[38;5;196m  [NEGATIVE]\033[0m"
	else
		echo -e "\e[38;2;34;160;182m Nacho-Wifi\e[0m \e[38;2;0;255;159m  [Connected]\e[0m"
	fi	
}
clear 
draw_progress() {
	local width=50
	local progress=$((width * $1 / 100))
	printf "\e[38;5;6m               "
	for ((i = 0; i < width; i++)); do
		if ((i <= progress)); then
			printf "▓"
		else
			printf "░"
		fi
	done
	printf "\e[0m \r"
}
for i in {0..100}; do
	draw_progress "$i"
	sleep 0.0025 
done
printf "\r"
sleep 0.5
clear  
text="	(v0.5)    Starting Simulation....        << $(echo $USER@$HOSTNAME) >>"
for ((i=0; i<${#text}; i++)); do
	echo -n -e "\033[38;5;196m${text:$i:1}\033[0m"  
	sleep 0.025  
done
sleep 0.5
echo ""
echo ""
{
figlet -f slant -c TheGassyNinja
echo "  ==============================================================================="
} | lolcat -t -a -s 100
echo -e "  \033[38;5;123m Terminal: Alacritty \033[0m\033[38;5;45m  StartX:  $(grep ^exec ~/.xinitrc | cut -d' ' -f2)\033[0m\033[38;5;6m  Shell: $(echo $SHELL)\033[0m\033[38;5;31m  $(uname -o) $(uname -r)\033[0m"
echo ""
echo -e "\e[38;2;0;255;249m                   [Pacman]\e[0m\e[38;2;0;184;255m  ($(pacman -Qq | wc -l))\e[0m\e[38;2;169;166;166m   <-Packages->\e[0m\e[38;2;0;255;249m   [AUR]\e[0m\e[38;2;0;184;255m    ($(yay -Qm  | wc -l))\e[0m"
echo -e "\e[38;2;0;255;249m                   [Pacman]\e[0m\e[38;2;255;0;149m    ($(pacman -Qu | wc -l))\e[0m\e[38;2;169;166;166m   <-Updates-->\e[0m\e[38;2;0;255;249m   [AUR]\e[0m\e[38;2;255;0;149m     ($(yay -Qum  | wc -l))\e[0m"
echo "            __________________________________________________________" |lolcat
echo -e "           $(check_wifi)  $(check_ether)"
sleep 0.8
if nslookup google.com &> /dev/null; then
	echo -ne "\e[38;2;44;132;255m                 DNS...\e[0m"; sleep 1.5; echo -ne "   [success]"
fi
if ping -c 1 google.com &> /dev/null; then
	echo -ne "\e[38;2;44;132;255m         Ping...\e[0m"; echo -ne "       [success]\n"
fi

/home/thegassyninja/Git/Welcome/Handler.sh &

sleep 0.2
echo "                                ______________________________________" |lolcat
text="     Checking NFS Mounts..."  
for ((i=0; i<${#text}; i++)); do
	echo -n -e "\033[38;5;196m${text:$i:1}\033[0m"  
	sleep 0.05  
done
file_path="$HOME/mnt/DataT/MOUNTED.txt"
if [ -e "$file_path" ]; then
	notify-send "DataT  -->  MOUNTED" 
	sleep 0.5 && echo -en "\r\033[K                                                \033[38;5;202m DataT:\033[0m \e\033[38;5;202m    [Mounted]\033[0m\n"
else
	notify-send "ERROR!!!!! (DataT)"
	sleep 0.5 && echo -en "\r\033[K                                                \033[38;5;202m DataT:\033[0m \e\033[38;5;196m  [FALIED]\033[0m\n"
fi
file_path="$HOME/mnt/Jenny/MOUNTED.txt"
if [ -e "$file_path" ]; then
	sleep 0.5 && echo -en "                                                \033[38;5;202m Jenny:\033[0m \e\033[38;5;202m    [Mounted]\033[0m\n"
	notify-send "Jenny  -->  MOUNTED"
else
	sleep 0.5 && echo -en "                                                \033[38;5;202m Jenny:\033[0m \e\033[38;5;196m  [FALIED]\033[0m\n"
	notify-send "ERROR!!!!! (JENNY)"
fi
file_path="$HOME/mnt/USB/MOUNTED.txt"
if [ -e "$file_path" ]; then
	sleep 0.5 && echo -en "                                                \033[38;5;202m USB:  \033[0m \e\033[38;5;202m    [Mounted]\033[0m\n"
	notify-send "USB    -->  MOUNTED" 
else
	sleep 0.5 && echo -en "                                                \033[38;5;202m USB:  \033[0m \e\033[38;5;196m  [FALIED]\033[0m\n"
	notify-send "USB    -->  NOT-MOUNTED"
fi
text="                 WELCOME to the Machine...     "  
for ((i=0; i<${#text}; i++)); do
	echo -n -e "\033[38;5;32m${text:$i:1}\033[0m"  
	sleep 0.05  
done
echo -e "\n"
# No Errors^^
