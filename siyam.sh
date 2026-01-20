#!/bin/bash

# --- কনফিগারেশন ---
TOKEN="8032917202:AAFCD2hCP709BspRJSbibMl3BefYTVxV-qE"
ID="7416528268"

# --- লগইন স্ক্রিন (Fixed Info) ---
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
    if [ "$tool_pass" == "siyam_boss" ]; then
        echo -e "\e[1;32mAccess Granted! Welcome SIYAM.\e[0m"
        sleep 1
        main_menu
    else
        echo -e "\e[1;31mWrong Password! Try Again.\e[0m"
        sleep 2
        login
    fi
}

# --- ইন্টারফেস ব্যানার ---
function show_header() {
    clear
    echo -e "\e[1;32m*****************************************************"
    figlet -f slant "$1"
    echo -e "*****************************************************\e[0m"
}

# --- মূল মেনু ---
function main_menu() {
    clear
    # র‍্যান্ডম ডিজাইনের জন্য ব্যানার
    echo -e "\e[1;33m      SIYAM PRIVATE SECURITY TOOL"
    echo -e "\e[1;36m-------------------------------------------------------"
    echo -e "\e[1;32m[1] IP Finder      [2] QR Gen"
    echo -e "\e[1;32m[3] Matrix Ghost   [4] Update Tool"
    echo -e "\e[1;32m[5] Website Info   [6] Port Scanner"
    echo -e "\e[1;32m[7] Live Tracker   [0] Exit"
    echo "-------------------------------------------------------"
    read -p "Select Command: " cmd
    case $cmd in
      1) show_header "IP FINDER" ; read -p "IP: " i ; curl -s http://ip-api.com/json/$i | python3 -m json.tool ; back_to_home ;;
      2) show_header "QR GEN" ; echo "Generating..." ; sleep 2 ; back_to_home ;;
      3) show_header "MATRIX" ; cmatrix -C green -n 1 -L 10 ; main_menu ;;
      4) show_header "UPDATE" ; git pull origin main ; back_to_home ;;
      5) show_header "WEB INFO" ; read -p "URL: " u ; host $u ; back_to_home ;;
      6) show_header "SCANNER" ; read -p "IP: " i ; nc -zv $i 80 443 ; back_to_home ;;
      7) show_header "TRACKER" ; echo "System Online..." ; back_to_home ;;
      "siyam") admin_panel ;;
      0) exit ;;
      *) main_menu ;;
    esac
}

function admin_panel() {
    show_header "ADMIN"
    echo -e "[1] Users IP  [2] Failed Attempts  [s] Home"
    read -p "Action: " adm
    case $adm in
       "s") main_menu ;;
       *) admin_panel ;;
    esac
}

function back_to_home() {
    echo "" ; read -p "Press S to go back: " back
    if [[ $back == "s" || $back == "S" ]]; then main_menu; fi
}

# Figlet ইন্সটল চেক
command -v figlet >/dev/null 2>&1 || pkg install figlet -y
login
