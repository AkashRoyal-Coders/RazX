#!/bin/bash


mv /data/data/com.termux/files/home/RazX/resources/bashrc /data/data/com.termux/files/home/RazX/resources/.bashrc
mv /data/data/com.termux/files/home/RazX/resources/systemBash /data/data/com.termux/files/home/RazX/resources/.systemBash


# <--Storage Setup-->
clear
echo -e "\e[32m[*] Setup Storage..."
sleep 2
termux-setup-storage
clear
echo -e "\e[32m[✓] Storage Setup Successfully"
sleep 2

# <--Updating Packages-->
clear
echo -e "\e[32m[*] Updateing Packages..."
sleep 2
pkg update
clear
pkg upgrade
clear
echo -e "\e[32m[✓] Packages Updated Successfully"
sleep 2

# <--Installing Repos-->
clear
echo -e "\e[32m[*] Installing Repos..."
sleep 2
pkg install x11-repo
clear
pkg install tur-repo
clear
pkg install termux-x11-nightly
clear
echo -e "\e[32m[✓] Repos Installed Successfully"
sleep 2

# <--Installing Some Packages-->
clear
echo -e "\e[32m[*] Installing Some Packages..."
sleep 2
pkg install python -y
clear
pip install lolcat
clear
echo -e "\e[32m[✓] Packages Installed Successfully"
sleep 2


bash razx.sh
