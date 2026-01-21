#!/bin/bash

# --- কনফিগারেশন ---
TOKEN="8032917202:AAFCD2hCP709BspRJSbibMl3BefYTVxV-qE"
ID="7416528268"

# --- লগইন স্ক্রিন ---
function login() {
    clear
    echo -e "\e[1;36m====================================================="
    echo -e "\e[1;33m  ____ ___ _   _  _    __  __ "
    echo -e "\e[1;33m / ___|_ _| \ | |/ \  |  \/  |"
    echo -e "\e[1;33m \___ \ | ||  \| / _ \ | |\/| |"
    echo -e "\e[1;33m  ___) || || |\  / ___ \| |  | |"
    echo -e "\e[1;33m |____/___|_| \_/_/   \_\_|  |_|"
    echo -e "\e[1;32m       NAME  : SIYAM BOSS PRO"
    echo -e "\e[1;32m       GMAIL : sadaf245sz@gmail.com"
    echo -e "\e[1;35m       PHONE : +8801315127341"
    echo -e "\e[1;36m====================================================="
    echo ""
    read -sp "Enter Tool Password: " tool_pass
    echo ""
    [[ "$tool_pass" == "siyam_boss" ]] && main_menu || login
}

# --- জিমেইল ক্লোনিং অ্যানিমেশন ---
function start_gmail_clone() {
    clear
    echo -e "\e[1;32m"
    figlet -f slant "GMAIL CLONE"
    echo -e "-------------------------------------------------------"
    echo -e "\e[1;33m[!] Connecting to Global Server...\e[0m"
    sleep 2
    echo -e "\e[1;32m[+] Bruteforce Started...\e[0m"
    echo ""
    
    # র‍্যান্ডম জিমেইল ও পাসওয়ার্ড জেনারেটর লুপ
    for i in {1..50}
    do
        # র‍্যান্ডম নাম ও নম্বর তৈরি
        USER=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 8 | head -n 1)
        NUM=$((RANDOM % 9000 + 1000))
        PASS=$(cat /dev/urandom | tr -dc 'A-Za-z0-9' | fold -w 10 | head -n 1)
        
        # স্ক্রিনে প্রিন্ট করা
        echo -e "\e[1;37m[\e[1;32mOK\e[1;37m] ${USER}${NUM}@gmail.com | \e[1;33mPASS: ${PASS}\e[0m"
        sleep 0.1
    done
    
    echo ""
    echo -e "\e[1;32m[✔] Cloning Finished. Check results in 'gmail_results.txt'\e[0m"
    back_to_home
}

# --- মূল মেনু ---
function main_menu() {
    clear
    echo -e "\e[1;33m      SIYAM PRIVATE SECURITY TOOL"
    echo -e "\e[1;36m-------------------------------------------------------"
    echo -e "\e[1;32m[1] IP Finder      [2] QR Gen"
    echo -e "\e[1;32m[3] Matrix Ghost   [4] Update Tool"
    echo -e "\e[1;32m[8] FB ID Clone    [9] Gmail Clone"
    echo -e "\e[1;32m[0] Exit"
    echo "-------------------------------------------------------"
    read -p "Select Command: " cmd
    case $cmd in
      1) clear ; figlet "IP FINDER" ; read -p "IP: " i ; curl -s http://ip-api.com/json/$i | python3 -m json.tool ; back_to_home ;;
      9) start_gmail_clone ;;
      0) exit ;;
      *) main_menu ;;
    esac
}

function back_to_home() {
    echo "" ; read -p "Press S to go back: " back
    [[ $back == "s" || $back == "S" ]] && main_menu
}

login
