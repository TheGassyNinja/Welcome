#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Tue Nov 14 2023 - 04:39
#  Last Mod: Mon Nov 20 2023 - 02:52
#  Config:
#  Depends:
#  Note:

#!/bin/bash

# Temporary file to store the output
output_file="$HOME/.local/tmp/CPU.txt"

TMP="$HOME/.local/tmp/CPU.txt"
background_function() {
    while true; do
cpu_idle="$(sar -u 1 1 | grep "Av" | awk '{print $NF}')"
cpu_usage="$(awk -v idle="$cpu_idle" 'BEGIN { print 100 - idle }')"
          echo "$cpu_usage" > "$TMP"
 	 sleep 2
    done
}
 background_function  
#export CPU_USE="$TMP"
# EOF
