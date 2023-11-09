#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Tue Nov 07 2023 - 13:01
#  Last Mod: Wed Nov 08 2023 - 04:20
#  Config: FZF Pacman Package Installer
#  Depends: FZF - Pacman
#  Note: Color and format - TLDR? - Man? - News?
#
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
#############################################################
#
#!/bin/bash
clear

# Vars:
U=$(sudo pacman -Qu | wc -l)
Y=$(yay -Qm | wc -l)
updates=$(pacman -Qu)

#######################################

fzf_update () {
if [ -n "$updates" ]; then
    # Create a menu to select packages using fzf
    choice=$(echo "$updates" | fzf --multi --prompt="Choose packages to install (Use Tab to select, Enter to install)" --preview="echo  {}" --header="Press 'ESC' to decline installing")
    echo -e "                    $choice    "
# Check the user's choice
    if [ -n "$choice" ]; then
        sudo pacman -S $(echo $choice | awk '{print $1}')
    else
        echo "No packages selected for installation."
    fi
else
    echo "No updates available."
fi
}


# List updates offer to update: (Interactive choice)
echo -e "            [XX] Pacman Updates   -  [XX] AUR Updates"
# echo -e "            [$U] Pacman Updates   -  [$Y] AUR Updates"
echo -e "          _____________________________________________" | lolcat
echo -e " "
echo "		1. Perform a full system update"
echo "		2. List available in FZF popup"
read -p "		Enter your choice (1/2): " choice
case $choice in
    1)
        echo "Run sudo pacman -Syu"
        ;;
    2)
	clear; fzf_update
        ;;
    *)
        echo "Not Updating now."
        ;;
esac
#
#sleep 1.5; clear
#echo "NEXT>>>>> or Close?"





















#
#
#
#
