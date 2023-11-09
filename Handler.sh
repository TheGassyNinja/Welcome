#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Tue Nov 07 2023 - 10:31
#  Last Mod: Thu Nov 09 2023 - 05:16
#  Config:
#  Depends:
#  Note: Concept is to open windows in the right order at the right time. (DWM ISSUE??)
#  (DWM issues??)
#  move focus to start after run
#  place term in master area
#  Setting sizes
#  
#  Xdotool
#  dwm-ipc
#  dwmc??
#
#
#
#!/bin/bash
# Never see this script run.
# clear
# echo "Testing"
# sleep 5

 
alacritty -e bash -c '/home/thegassyninja/Git/Welcome/Functions/fzf-pac.sh; bash' &
sleep 0.2
#alacritty -e bash -c '/home/thegassyninja/Projects/Welcome/Actions.sh; bash' &
sleep 0.2
alacritty -e bash -c '/home/thegassyninja/Git/Welcome/Stats.sh; bash' &

