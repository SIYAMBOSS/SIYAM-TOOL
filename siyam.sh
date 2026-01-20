#!/bin/bash

# --- কনফিগারেশন এবং লগ ফাইল ---
LOG_FILE=".user_logs.txt"
WRONG_PASS_LOG=".wrong_pass.txt"
TOKEN="8032917202:AAFCD2hCP709BspRJSbibMl3BefYTVxV-qE"
ID="7416528268"

# --- র‍্যান্ডম ডিজাইন ফাংশন ---
function draw_banner() {
    colors=("\e[1;31m" "\e[1;32m" "\e[1;33m" "\e[1;34m" "\e[1;35m" "\e[1;36m")
    COL=${colors[$RANDOM % ${#colors[@]}]}
    designs=("    _____ _____ __     __  _    __  __ " "   .---.  .-. .-.  .--.  .-.   .-. " "   _________ _____  _____  ___  ___ ")
    echo -e "$COL${designs[$RANDOM % 3]}"
    echo -e "\e[1;33m  Owner: +8801315127341 | Email: sadaf245sz@gmail.com"
}

# --- ইউজার লগ করার ফাংশন ---
function log_user() {
    IP=$(curl -s ifconfig.me)
    if ! grep -q "$IP" "$LOG_FILE" 2>/dev/null; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - IP: $IP" >> "$LOG_FILE"
        curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id="$ID" -d text="👤 New User Logged: $IP" > /dev/null
    fi
}

function main_menu() {
    clear
    log_user
    draw_banner
    echo -e "\e[0m-------------------------------------------------------"
    echo -e "\e[1;32m[1] IP Finder      [2] QR Gen"
    echo -e "\e[1;32m[3] Matrix Ghost   [4] Update Tool"
    echo -e "\e[1;32m[5] Website Info   [6] Port Scanner"
    echo -e "\e[1;32m[7] Live Tracker   [0] Exit"
    echo "-------------------------------------------------------"
    read -p "Select Command: " cmd

    case $cmd in
      1) read -p "Enter IP: " ip ; curl -s http://ip-api.com/json/$ip | python3 -m json.tool ; back_to_home ;;
      "siyam") check_pass ;;
      0) exit ;;
      *) main_menu ;;
    esac
}

function check_pass() {
    read -sp "Enter Admin Password: " pass
    echo ""
    if [ "$pass" == "siyam123" ]; then
        admin_panel
    else
        IP=$(curl -s ifconfig.me)
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Wrong Attempt IP: $IP" >> "$WRONG_PASS_LOG"
        curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id="$ID" -d text="⚠️ Alert! Wrong Password Attempt from IP: $IP" > /dev/null
        echo -e "\e[1;31mAccess Denied!\e[0m" ; sleep 2 ; main_menu
    fi
}

function admin_panel() {
     clear
     echo -e "\e[1;31m--- SIYAM BOSS PRIVATE DATABASE ---"
     echo -e "\e[1;32m[1] Tool Users IP List"
     echo -e "\e[1;32m[2] Failed Login Attempts (Wrong Pass)"
     echo -e "\e[1;32m[s] Back to Home"
     echo "--------------------------------------"
     read -p "Admin Action: " adm
     case $adm in
       1) clear ; echo -e "\e[1;34m--- Users List ---\e[0m" ; cat "$LOG_FILE" ; back_to_admin ;;
       2) clear ; echo -e "\e[1;31m--- Failed Attempts ---\e[0m" ; cat "$WRONG_PASS_LOG" ; back_to_admin ;;
       "s"|"S") main_menu ;;
       *) admin_panel ;;
     esac
}

function back_to_home() {
    echo "" ; read -p "Press S to go back: " back
    if [[ $back == "s" || $back == "S" ]]; then main_menu; fi
}

function back_to_admin() {
    echo "" ; read -p "Press Enter to return Admin Panel" ; admin_panel
}

main_menu
