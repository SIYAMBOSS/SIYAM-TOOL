#!/bin/bash

# --- LOGIN SYSTEM ---
function login() {
    clear
    echo -e "\e[1;36m====================================================="
    echo -e "\e[1;33m  ____ ___ _   _  _    __  __ "
    echo -e "\e[1;33m / ___|_ _| \ | |/ \  |  \/  |"
    echo -e "\e[1;33m \___ \ | ||  \| / _ \ | |\/| |"
    echo -e "\e[1;33m  ___) || || |\  / ___ \| |  | |"
    echo -e "\e[1;33m |____/___|_| \_/_/   \_\_|  |_|"
    echo -e "\e[1;32m       NAME  : SIYAM BOSS"
    echo -e "\e[1;32m       GMAIL : sadaf245sz@gmail.com"
    echo -e "\e[1;35m       PHONE : +8801315127341"
    echo -e "\e[1;36m====================================================="
    echo -e "\e[1;31m             [ ACCESS RESTRICTED ]"
    echo ""
    read -sp "Enter Tool Password: " tool_pass
    echo ""
    if [ "$tool_pass" == "siyam_boss" ]; then
        echo -e "\e[1;32mAccess Granted! Welcome User.\e[0m"
        sleep 1
        main_menu
    else
        echo -e "\e[1;31mWrong Password! Access Denied.\e[0m"
        sleep 2
        login
    fi
}

# --- OTHER TOOLS INTERFACE ---
function show_header() {
    clear
    echo -e "\e[1;32m"
    figlet -f slant "$1"
    echo -e "-------------------------------------------------------\e[0m"
}

function main_menu() {
    clear
    echo -e "\e[1;33m      SIYAM PRIVATE SECURITY TOOL"
    echo -e "\e[1;36m-------------------------------------------------------"
    echo -e "\e[1;32m[1] IP Finder      [2] QR Gen"
    echo -e "\e[1;32m[3] Matrix Ghost   [4] Update Tool"
    echo -e "\e[1;32m[5] Website Info   [6] Port Scanner"
    echo "-------------------------------------------------------"
    read -p "Select Command: " cmd
    case $cmd in
      1) show_header "IP FINDER" ; read -p "IP: " i ; curl -s http://ip-api.com/json/$i | python3 -m json.tool ; back_to_home ;;
      2) show_header "QR GEN" ; echo "Working..." ; sleep 2 ; back_to_home ;;
      3) show_header "MATRIX" ; cmatrix -C green -n 1 -L 10 ; main_menu ;;
      *) main_menu ;;
    esac
}

function back_to_home() {
    echo "" ; read -p "Press S to go back: " back
    [[ $back == "s" || $back == "S" ]] && main_menu
}

login
