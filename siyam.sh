#!/bin/bash

# --- Random Color Function ---
function random_color() {
    colors=("\e[1;31m" "\e[1;32m" "\e[1;33m" "\e[1;34m" "\e[1;35m" "\e[1;36m" "\e[1;37m")
    selected_color=${colors[$RANDOM % ${#colors[@]}]}
    echo -ne "$selected_color"
}

# --- Main Menu Function ---
function main_menu() {
clear
TOKEN="8032917202:AAFCD2hCP709BspRJSbibMl3BefYTVxV-qE"
ID="7416528268"

# প্রতিবার র‍্যান্ডম রঙ সেট করা
COL=$(random_color)

echo -e "$COL    _____ _____ __     __  _    __  __ "
echo -e "$COL   / ____|_   _\ \   / / / \  |  \/  |"
echo -e "$COL  | (___   | |  \ \_/ / / _ \ | \  / |"
echo -e "$COL   \___ \  | |   \   / / ___ \| |\/| |"
echo -e "$COL   ____) |_| |_   | | /_/   \_\_|  |_|"
echo -e "$COL  |_____/|_____|  |_|                 "
echo -e "$COL         SIYAM BOSS PRO SECURITY TOOL"
echo -e "\e[1;33m  Owner: +8801315127341 | Email: sadaf245sz@gmail.com"
echo -e "\e[0m-------------------------------------------------------"
echo -e "\e[1;32m[1] IP Finder      [2] QR Gen"
echo -e "\e[1;32m[3] Matrix Ghost   [4] Update Tool"
echo -e "\e[1;32m[5] Website Info   [6] Port Scanner"
echo -e "\e[1;32m[7] Live Tracker   [0] Exit"
echo "-------------------------------------------------------"
read -p "Select Command: " cmd

case $cmd in
  1) 
     read -p "Enter Target IP: " target_ip
     if [ -z "$target_ip" ]; then target_ip=$(curl -s ifconfig.me); fi
     curl -s http://ip-api.com/json/$target_ip | python3 -m json.tool
     back_to_home ;;
  2) 
     echo -e "\e[1;31mQR Gen process is active.\e[0m"
     back_to_home ;;
  3) cmatrix -C green -b ; main_menu ;;
  4) git pull origin main ; sleep 2 ; main_menu ;;
  5) read -p "URL: " u ; host $u ; back_to_home ;;
  6) read -p "IP: " i ; nc -zv $i 80 443 ; back_to_home ;;
  7) read -p "Phone: " p ; echo "Tracking $p..." ; back_to_home ;;
  "siyam") admin_panel ;;
  0) exit ;;
  *) echo -e "\e[1;31mInvalid!\e[0m" ; sleep 1 ; main_menu ;;
esac
}

function back_to_home() {
    echo ""
    while true; do
        read -p "Press S to go back: " back
        if [[ $back == "s" || $back == "S" ]]; then
            main_menu
            break
        fi
    done
}

function admin_panel() {
     clear
     echo -e "\e[1;31m--- WELCOME TO HIDDEN ADMIN PANEL ---"
     echo -e "\e[1;32m[A] Social Hack    [B] Bot Setup"
     echo -e "\e[1;32m[C] Database Access [s] Back to Home"
     echo "--------------------------------------"
     read -p "Admin Action: " adm
     case $adm in
       "s"|"S") main_menu ;;
       *) admin_panel ;;
     esac
}

main_menu
