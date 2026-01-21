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

# --- বড় হেডলাইন ---
function show_header() {
    clear
    echo -e "\e[1;32m"
    figlet -f slant "$1"
    echo -e "-------------------------------------------------------\e[0m"
}

# --- ক্লোনিং লজিক ---
function start_fb_clone() {
    show_header "FB CLONE"
    echo -e "\e[1;33m[!] সিস্টেম চেক করা হচ্ছে..."
    sleep 1
    echo -e "\e[1;32m[+] সার্ভার কানেক্টেড!"
    echo -e "\e[1;37mবর্তমানে এই ফিচারের জন্য আপনার ফোনে 'python' ও 'requests' প্রয়োজন।"
    read -p "টার্গেট আইডি বা ইউজারনেম দিন: " target
    echo -e "\e[1;31m[!] ক্র্যাকিং শুরু হচ্ছে: $target ..."
    # এখানে আসল ক্লোনিং স্ক্রিপ্ট কল করতে পারেন
    sleep 3
    back_to_home
}

function start_gmail_clone() {
    show_header "GMAIL CLONE"
    echo -e "\e[1;32mConnecting to Server...\e[0m"
    read -p "টার্গেট জিমেইল দিন: " target_mail
    echo -e "\e[1;33m[~] ডিক্রিপ্টিং পাসওয়ার্ড লিস্ট..."
    sleep 3
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
      1) show_header "IP FINDER" ; read -p "IP: " i ; curl -s http://ip-api.com/json/$i | python3 -m json.tool ; back_to_home ;;
      8) start_fb_clone ;;
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
