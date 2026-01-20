#!/bin/bash

# --- মূল মেনু ফাংশন ---
function main_menu() {
clear
# গিটহাব অ্যালার্ট এবং ওনার ডিটেইলস
TOKEN="8032917202:AAFCD2hCP709BspRJSbibMl3BefYTVxV-qE"
ID="7416528268"

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
  1) 
     read -p "Enter Target IP: " target_ip
     if [ -z "$target_ip" ]; then target_ip=$(curl -s ifconfig.me); fi
     echo -e "\e[1;32mFetching data for $target_ip...\e[0m"
     # JSON ডাটা সুন্দরভাবে সাজিয়ে দেখানো
     curl -s http://ip-api.com/json/$target_ip | python3 -m json.tool
     echo ""
     while true; do
        read -p "Press S to go back: " back
        if [[ $back == "s" || $back == "S" ]]; then main_menu; break; fi
     done ;;
  2) read -p "Enter text: " qr ; qrencode -t ansiutf8 "$qr" ; sleep 5 ; main_menu ;;
  3) cmatrix -C green -b ; main_menu ;;
  4) git pull origin main ; sleep 2 ; main_menu ;;
  5) read -p "URL: " u ; host $u ; sleep 5 ; main_menu ;;
  6) read -p "IP: " i ; nc -zv $i 80 443 ; sleep 5 ; main_menu ;;
  7) read -p "Phone: " p ; echo "Tracking $p..." ; sleep 5 ; main_menu ;;
  "siyam") admin_panel ;;
  0) exit ;;
  *) echo -e "\e[1;31mInvalid Option!\e[0m" ; sleep 1 ; main_menu ;;
esac
}

# --- অ্যাডমিন প্যানেল ফাংশন ---
function admin_panel() {
     clear
     echo -e "\e[1;31m--- WELCOME TO HIDDEN ADMIN PANEL ---"
     echo -e "\e[1;32m[A] Social Hack    [B] Bot Setup"
     echo -e "\e[1;32m[C] Database Access [s] Back to Home"
     echo "--------------------------------------"
     read -p "Admin Action: " adm
     case $adm in
       [Aa]) echo "Starting Social Hack..." ; sleep 2 ; admin_panel ;;
       [Bb]) echo "Configuring Bot..." ; sleep 2 ; admin_panel ;;
       [Cc]) echo "Accessing Database..." ; sleep 2 ; admin_panel ;;
       "s"|"S") main_menu ;;
       *) echo "Invalid!" ; sleep 1 ; admin_panel ;;
     esac
}
main_menu
