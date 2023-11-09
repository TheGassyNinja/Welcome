#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Sun Nov 05 2023 - 04:56
#  Last Mod: Mon Nov 06 2023 - 07:04
#  Config: Startup Terminal Inroduction
#  Depends:
#  Note:Add audio? Status? Run MNTs?? 
#  Clean up/set colors - Add Glyphs?!
# 
# ## Helpful clips
# echo -e "     \e[38;5;202mRed\e[0m \e[38;5;51mGreen\e[0m \e[38;5;27mBlue\e[0m"
# echo -e "\033[38;5;202mHello, this is a text in 256 colors!\033[0m"
# echo -e "\033[38;5;196m .\033[0m"
# sudo mount -t nfs -o vers=4 192.168.254.169:/srv/nfs/DataT ~/mnt/DataT
# sudo mount -t nfs -o vers=4 192.168.254.169:/srv/nfs/Jenny ~/mnt/Jenny 


##################################################################################
#!/bin/bash

export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus export DISPLAY=:0;
if [ -r "$HOME/.dbus/Xdbus" ]; then
	. "$HOME/.dbus/Xdbus"
fi
# Set TERM to xterm-256color
export TERM=xterm-256color
mounted="$HOME/.config/bspwm/Scripts/all-remote-drives-have-been-mounted.mp3"
PING=$(ping -c 1 google.com) 
DNS=$(nslookup google.com | grep "google.com" | wc -l)
ETHER=$(nmcli connection | grep "eno" | awk '{print $NF}') 
WIFI=$(nmcli connection | grep "wlo1" | awk '{print $NF}') 

sudo mount -t nfs -o vers=4 192.168.254.169:/srv/nfs/DataT ~/mnt/DataT
sudo mount -t nfs -o vers=4 192.168.254.169:/srv/nfs/Jenny ~/mnt/Jenny 



# Check for Ethernet Connection
check_ether () {
	if [[ $ETHER = "" ]]; then
		echo -e "    \033[38;5;202m HARDLINE: \033[0m   \033[38;5;196m  [NEGATIVE!!]\033[0m"
	else
		echo -e "    \033[38;5;202m HARDLINE: \033[0m   \033[38;5;175m  [Connected]\033[0m"

	fi	
}

# Check if Wifi
check_wifi () {
	if [[ $WIFI = "" ]]; then
		echo -e "\033[38;5;202m Nacho-Wifi\033[0m \e\033[38;5;196m  [NEGATIVE]\033[0m"
	else
		echo -e "\033[38;5;202m Nacho-Wifi\033[0m \e\033[38;5;175m  [Connected]\033[0m"

	fi	
}


check_ping () {
	if [[ $PING = "" ]]; then
		echo -e "            \033[38;5;202m Ping:\033[0m \e\033[38;5;196m  [NEGATIVE]\033[0m"
	else
		echo -e "                 \033[38;5;202m Pinging...       \033[0m \e\033[38;5;175m        [Connected]\033[0m"

	fi	
}

check_dns() {
	if [[ "$DNS" -gt 1 ]]; then
		
		echo -e "                 \033[38;5;202m Resolving DNS... \033[0m \e\033[38;5;175m[Connected]\033[0m"
    else
		echo -e "            \033[38;5;202m Resolving DNS...\033[0m \e\033[38;5;196m  [NEGATIVE]\033[0m"
    fi
}


###### Start of output
# cmatrix &
# sleep 3; pkill cmatrix 

clear  # Clear the screen
# echo -e "\033[38;5;196m                Starting Simulation...    << $(echo $USER@$HOSTNAME) >> \033[0m"
text="	    Starting Simulation....        << $(echo $USER@$HOSTNAME) >>"
for ((i=0; i<${#text}; i++)); do
	echo -n -e "\033[38;5;196m${text:$i:1}\033[0m"  # Echo each character in green
	sleep 0.05  # Wait for a short interval to simulate typing speed
done
sleep 0.5
echo ""
# figlet/lolcat
figlet -f slant -c TheGassyNinja | lolcat
echo "=================================================================================" | lolcat
echo -e "\033[38;5;23m                                 Shell: $(echo $SHELL)       $(uname -o) $(uname -r)"
echo -e "\033[38;5;51m   StartX:  $(grep ^exec ~/.xinitrc | cut -d' ' -f2)\033[0m"
echo -e "\033[38;5;87m              Packages: [Pacman]  ($(pacman -Qq | wc -l))      [AUR]    ($(yay -Qm  | wc -l))\033[0m"
echo -e "\033[38;5;87m              Updates:  [Pacman]  ($(pacman -Qu | wc -l))        [AUR]    ($(yay -Qum  | wc -l))\033[0m"
echo "            __________________________________________________________" |lolcat
echo -e "           $(check_wifi)  $(check_ether)"
sleep 0.5
echo -e "              $(check_ping)"
sleep 0.8
echo -e "                      $(check_dns)"
sleep 0.2
echo "                                ______________________________________" |lolcat

text="     Checking NFS Mounts..."  # Text to display
for ((i=0; i<${#text}; i++)); do
	echo -n -e "\e[32m${text:$i:1}\e[0m"  # Echo each character in green
	sleep 0.05  # Wait for a short interval to simulate typing speed
done

file_path="$HOME/mnt/DataT/MOUNTED.txt"
# Check if the file exists
if [ -e "$file_path" ]; then
	notify-send "DataT  -->  MOUNTED" 
	sleep 0.5 && echo -en "\r\033[K                                                \033[38;5;202m DataT:\033[0m \e\033[38;5;202m    [Mounted]\033[0m\n"

else
	notify-send "ERROR!!!!! (DataT)"
	sleep 0.5 && echo -en "\r\033[K                                                \033[38;5;202m DataT:\033[0m \e\033[38;5;196m  [FALIED]\033[0m\n"
fi

file_path="$HOME/mnt/Jenny/MOUNTED.txt"
# Check if the file exists
if [ -e "$file_path" ]; then
	sleep 0.5 && echo -en "                                                \033[38;5;202m Jenny:\033[0m \e\033[38;5;202m    [Mounted]\033[0m\n"
    notify-send "Jenny  -->  MOUNTED"
else
	sleep 0.5 && echo -en "                                                \033[38;5;202m Jenny:\033[0m \e\033[38;5;196m  [FALIED]\033[0m\n"
	notify-send "ERROR!!!!! (JENNY)"
fi

file_path="$HOME/mnt/USB/MOUNTED.txt"
# Check if the file exists
if [ -e "$file_path" ]; then
	sleep 0.5 && echo -en "                                                \033[38;5;202m USB:  \033[0m \e\033[38;5;202m    [Mounted]\033[0m\n"
    notify-send "USB    -->  MOUNTED" 
else
	sleep 0.5 && echo -en "                                                \033[38;5;202m USB:  \033[0m \e\033[38;5;196m  [FALIED]\033[0m\n"
    notify-send "USB    -->  NOT-MOUNTED"
fi

mpg123 -q "$mounted" &



text="                 WELCOME to the Machine..."  # Text to display
for ((i=0; i<${#text}; i++)); do
	echo -n -e "\e[32m${text:$i:1}\e[0m"  # Echo each character in green
	sleep 0.05  # Wait for a short interval to simulate typing speed
done

echo -e "\n"

exit





