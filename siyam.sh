#!/bin/bash

# --- কনফিগারেশন ও লগ ফাইল ---
LOG_FILE=".user_logs.txt"
WRONG_PASS_LOG=".wrong_pass.txt"
TOKEN="8032917202:AAFCD2hCP709BspRJSbibMl3BefYTVxV-qE"
ID="7416528268"

# --- লগইন স্ক্রিন (আপনার তথ্যসহ) ---
function login() {
    clear
    echo -e "\e[1;36m====================================================="
    echo -e "\e[1;33m  ____ ___ _   _  _    __  __ "
    echo -e "\e[1;33m / ___|_ _| \ | |/ \  |  \/  |"
    echo -e "\e[1;33m \___ \ | ||  \| / _ \ | |\/| |"
    echo -e "\e[1;33m  ___) || || |\  / ___ \| |  | |"
    echo -e "\e[1;33m |____/___|_| \_/_/   \_\_|  |_|"
    echo -e "\e[1;32m       GMAIL : sadaf245sz@gmail.com"
    echo -e "\e[1;35m       PHONE : +8801315127341"
    echo -e "\e[1;36m====================================================="
    echo -e "\e[1;31m             [ ACCESS RESTRICTED ]"
    echo ""
    read -sp "Enter Tool Password: " tool_pass
    echo ""
    if [[ "$tool_pass" == "siyam_boss" ]]; then
        echo -e "\e[1;32mAccess Granted! Welcome SIYAM.\e[0m"
        sleep 1
        main_menu
    else
        echo -e "\e[1;31mWrong Password!\e[0m"
        sleep 1
        login
    fi
}

# --- বড় হেডলাইন ইন্টারফেস ---
function show_header() {
    clear
    echo -ne "\e[1;32m"
    figlet -f slant "$1"
    echo -e "-------------------------------------------------------\e[0m"
}

# --- মূল মেনু ---
function main_menu() {
    clear
    echo -e "\e[1;33m      SIYAM PRIVATE SECURITY TOOL"
    echo -e "\e[1;36m-------------------------------------------------------"
    echo -e "\e[1;32m[1] IP Finder      [2] QR Gen"
    echo -e "\e[1;32m[3] Matrix Ghost   [4] Update Tool"
    echo -e "\e[1;32m[5] Website Info   [6] Port Scanner"
    echo -e "\e[1;32m[7] Live Tracker   [0] Exit"
    echo "-------------------------------------------------------"
    read -p "Select Command: " cmd
    case $cmd in
      1) show_header "IP FINDER"
         read -p "Enter Target IP: " ip
         curl -s http://ip-api.com/json/$ip | python3 -m json.tool ; back_to_home ;;
      2) show_header "QR GEN"
         read -p "Enter text for QR: " qr_text
         echo "Generating QR for $qr_text..." ; sleep 2 ; back_to_home ;;
      3) show_header "MATRIX" ; cmatrix -C green -n 1 -L 10 ; main_menu ;;
      4) show_header "UPDATE" ; git pull origin main ; back_to_home ;;
      5) show_header "WEB INFO" ; read -p "Enter Website: " web ; host $web ; back_to_home ;;
      6) show_header "SCANNER" ; read -p "Enter IP to scan: " sc_ip ; nc -zv $sc_ip 80 443 ; back_to_home ;;
      7) show_header "TRACKER" ; echo "Tracking system online..." ; back_to_home ;;
      "siyam") check_admin_pass ;;
      0) exit ;;
      *) main_menu ;;
    esac
}

function check_admin_pass() {
    read -sp "Enter Admin Password: " pass
    [[ "$pass" == "siyam123" ]] && admin_panel || main_menu
}

function admin_panel() {
    show_header "ADMIN PANEL"
    echo -e "\e[1;34m[1] View User IPs  [2] Wrong Attempts  [s] Home"
    read -p "Action: " adm
    case $adm in
       1) cat "$LOG_FILE" ; read -p "Press Enter to return" ; admin_panel ;;
       2) cat "$WRONG_PASS_LOG" ; read -p "Press Enter to return" ; admin_panel ;;
       "s") main_menu ;;
       *) admin_panel ;;
    esac
}

function back_to_home() {
    echo "" ; read -p "Press S to go back: " back
    [[ $back == "s" || $back == "S" ]] && main_menu
}

# প্রয়োজনীয় প্যাকেজ ইন্সটল
command -v figlet >/dev/null 2>&1 || pkg install figlet -y
login
