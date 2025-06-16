#!/bin/bash

clear

# <--Logo Printing-->
echo -e "
█████████████████████████████████████████████████████████████████████████
█░░░░░░░░░░░░░░░░███░░░░░░░░░░░░░░█░░░░░░░░░░░░░░░░░░█░░░░░░░░██░░░░░░░░█
█░░▄▀▄▀▄▀▄▀▄▀▄▀░░███░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀░░██░░▄▀▄▀░░█
█░░▄▀░░░░░░░░▄▀░░███░░▄▀░░░░░░▄▀░░█░░░░░░░░░░░░▄▀▄▀░░█░░░░▄▀░░██░░▄▀░░░░█
█░░▄▀░░████░░▄▀░░███░░▄▀░░██░░▄▀░░█████████░░░░▄▀░░░░███░░▄▀▄▀░░▄▀▄▀░░███
█░░▄▀░░░░░░░░▄▀░░███░░▄▀░░░░░░▄▀░░███████░░░░▄▀░░░░█████░░░░▄▀▄▀▄▀░░░░███
█░░▄▀▄▀▄▀▄▀▄▀▄▀░░███░░▄▀▄▀▄▀▄▀▄▀░░█████░░░░▄▀░░░░█████████░░▄▀▄▀▄▀░░█████
█░░▄▀░░░░░░▄▀░░░░███░░▄▀░░░░░░▄▀░░███░░░░▄▀░░░░█████████░░░░▄▀▄▀▄▀░░░░███
█░░▄▀░░██░░▄▀░░█████░░▄▀░░██░░▄▀░░█░░░░▄▀░░░░███████████░░▄▀▄▀░░▄▀▄▀░░███
█░░▄▀░░██░░▄▀░░░░░░█░░▄▀░░██░░▄▀░░█░░▄▀▄▀░░░░░░░░░░░░█░░░░▄▀░░██░░▄▀░░░░█
█░░▄▀░░██░░▄▀▄▀▄▀░░█░░▄▀░░██░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀░░██░░▄▀▄▀░░█
█░░░░░░██░░░░░░░░░░█░░░░░░██░░░░░░█░░░░░░░░░░░░░░░░░░█░░░░░░░░██░░░░░░░░█
█████████████████████████████████████████████████████████████████████████" | lolcat
echo ""

# <--Welcome Printing-->
echo -e "\e[35m========================"
echo ""
echo -e "\e[35mWelcome To RazX OS V1.11"
echo ""
echo -e "\e[35m========================"
echo ""

# <--Desktop Choice-->
echo -e "\e[35mChoice Your Desktop Type..."
echo ""
echo -e "\e[32m 1 Nano Desktop"
echo -e "\e[32m 2 Full Desktop"
echo ""
read -p "Enter Your Desktop Number: " choice
case $choice in
   1)
    # <--Nano Desktop Setup-->
    clear
    echo -e "\e[32m[*] Installing Nano Desktop..."
    ;;
   2)
    # <--Full Desktop Setup-->
    clear
    echo -e "\e[32m[*] Installing Full Desktop..."
    sleep 2
    pkg install xfce4 -y
    clear
    pkg install xfce4-goodies -y
    clear
    pkg install chromium -y
    clear
    pkg install xfce4-genmon-plugin -y
    clear
    pkg install jq -y
    clear
    echo -e "\e[32m[✓] Desktop Installed Successfully"
    bash setup-launch.sh
    ;;
   *)
    # <--Error in Invalid choice-->
    clear
    echo -e "\e[31mInvalid choice. Please run the script again and choose"
    ;;
esac