#!/bin/bash

# --- CONFIG & LOGS ---
LOG_FILE=".user_logs.txt"
WRONG_PASS_LOG=".wrong_pass.txt"
TOKEN="8032917202:AAFCD2hCP709BspRJSbibMl3BefYTVxV-qE"
ID="7416528268"

# --- LOGIN SYSTEM WITH PERSONAL INFO ---
function login() {
    clear
    echo -e "\e[1;36m====================================================="
    echo -e "\e[1;33m       NAME  : SIYAM BOSS PRO"
    echo -e "\e[1;32m       GMAIL : sadaf245sz@gmail.com"
    echo -e "\e[1;35m       PHONE : +8801315127341"
    echo -e "\e[1;36m====================================================="
    echo -e "\e[1;31m             [ ACCESS RESTRICTED ]"
    echo ""
    read -sp "Enter Tool Password: " tool_pass
    echo ""
    if [ "$tool_pass" == "siyam_boss" ]; then
        echo -e "\e[1;32mAccess Granted! Welcome Siyam.\e[0m"
        sleep 1
        main_menu
    else
        IP=$(curl -s ifconfig.me)
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Tool Login Fail: $IP" >> "$WRONG_PASS_LOG"
        curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id="$ID" -d text="❌ Unauthorized access attempt: $IP" > /dev/null
        echo -e "\e[1;31mWrong Password! Try Again.\e[0m"
        sleep 2
        login
    fi
}

# --- RANDOM COLOR & FIXED DESIGNS ---
function col() {
    colors=("\e[1;31m" "\e[1;32m" "\e[1;33m" "\e[1;34m" "\e[1;35m" "\e[1;36m")
    echo -ne "${colors[$RANDOM % ${#colors[@]}]}"
}

function draw_banner() {
    C=$(col)
    case $((RANDOM % 3)) in
        0)
            echo -e "${C}    _____ _____ __     __  _    __  __ "
            echo -e "${C}   / ____|_   _\ \   / / / \  |  \/  |"
            echo -e "${C}  | (___   | |  \ \_/ / / _ \ | \  / |"
            echo -e "${C}   \___ \  | |   \   / / ___ \| |\/| |"
            echo -e "${C}   ____) |_| |_   | | /_/   \_\_|  |_|"
            echo -e "${C}  |_____/|_____|  |_|  SIYAM BOSS PRO " ;;
        1)
            echo -e "${C}   .---.  .-. .-.  .--.  .-.   .-. "
            echo -e "${C}  (  _  ) | | | | / /\ \ |  \ /  | "
            echo -e "${C}   \ \    | | | |/ /__\ \| \   / | "
            echo -e "${C}  _ \ \   | | | ||  __  || |\_/| | "
            echo -e "${C} ( '___' )| |_| || |  | || |   | | "
            echo -e "${C}  '-----' '-----''-'  '-''-'   '-' " ;;
        2)
            echo -e "${C}   _________  __ ___   __  ___ "
            echo -e "${C}  / __/  _/ \/ // _ | /  |/  / "
            echo -e "${C} _\ \ _/ / \  // __ |/ /|_/ /  "
            echo -e "${C}/___//___/ /_//_/ |_/_/  /_/   "
            echo -e "${C}      SIYAM SECURITY TOOL      " ;;
    esac
}

function log_user() {
    IP=$(curl -s ifconfig.me)
    if ! grep -q "$IP" "$LOG_FILE" 2>/dev/null; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - IP: $IP" >> "$LOG_FILE"
        curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id="$ID" -d text="👤 New User Logged: $IP" > /dev/null
    fi
}

function main_menu() {
    clear ; log_user ; draw_banner
    echo -e "\e[1;33m  Owner: +8801315127341 | Email: sadaf245sz@gmail.com"
    echo -e "\e[0m-------------------------------------------------------"
    echo -e "\e[1;32m[1] IP Finder      [2] QR Gen"
    echo -e "\e[1;32m[3] Matrix Ghost   [4] Update Tool"
    echo -e "\e[1;32m[5] Website Info   [6] Port Scanner"
    echo -e "\e[1;32m[7] Live Tracker   [0] Exit"
    echo "-------------------------------------------------------"
    read -p "Select Command: " cmd
    case $cmd in
      1) read -p "Enter IP: " ip ; curl -s http://ip-api.com/json/$ip | python3 -m json.tool ; back_to_home ;;
      "siyam") check_admin_pass ;;
      0) exit ;;
      *) main_menu ;;
    esac
}

function check_admin_pass() {
    read -sp "Enter Admin Password: " pass ; echo ""
    if [ "$pass" == "siyam123" ]; then admin_panel
    else
        echo -e "\e[1;31mInvalid Admin Pass!\e[0m" ; sleep 2 ; main_menu
    fi
}

function admin_panel() {
    clear ; echo -e "\e[1;31m--- ADMIN DATABASE ---"
    echo -e "\e[1;32m[1] Tool Users IP     [2] Login Attempt IPs"
    echo -e "\e[1;32m[s] Back to Home"
    read -p "Action: " adm
    case $adm in
       1) clear ; echo "--- Users ---" ; cat "$LOG_FILE" ; back_to_admin ;;
       2) clear ; echo "--- Attempts ---" ; cat "$WRONG_PASS_LOG" ; back_to_admin ;;
       "s"|"S") main_menu ;;
       *) admin_panel ;;
    esac
}

function back_to_home() {
    echo "" ; read -p "Press S to go back: " back
    if [[ $back == "s" || $back == "S" ]]; then main_menu; fi
}
function back_to_admin() {
    echo "" ; read -p "Press Enter" ; admin_panel
}

# Start with Login
login
