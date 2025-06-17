#!/bin/bash

mv /data/data/com.termux/files/home/RazX/Installer-resources/systemBash /data/data/com.termux/files/home/RazX/Installer-resources/.systemBash
mv /data/data/com.termux/files/home/RazX/Installer-resources/bashrc /data/data/com.termux/files/home/RazX/Installer-resources/.bashrc
# <--Installing Theme-->
clear
echo -e "\e[32m[*] Installing Theme..."

THEMES_DIR="$HOME/.themes"

if [ -d "$THEMES_DIR" ]; then
    echo " "
else
    mkdir -p "$THEMES_DIR"
fi

cd /data/data/com.termux/files/home/RazX/Installer-resources/theme
tar -xf theme.tar.xz -C ~/.themes

xfconf-query -c xsettings -p /Net/ThemeName -s "Fluent-round-Dark"
xfconf-query -c xfwm4 -p /general/theme -s "Fluent-round-Dark"
jq '.theme = "true"' /data/data/com.termux/files/home/RazX/installer.json > /data/data/com.termux/files/home/RazX/tmp.json && mv /data/data/com.termux/files/home/RazX/tmp.json /data/data/com.termux/files/home/RazX/installer.json
jq '.progress = 14' /data/data/com.termux/files/home/RazX/installer.json > /data/data/com.termux/files/home/RazX/tmp.json && mv /data/data/com.termux/files/home/RazX/tmp.json /data/data/com.termux/files/home/RazX/installer.json


# <--Installing Icon-->
sleep 2
ICONS_DIR="$HOME/.icons"

if [ -d "$ICONS_DIR" ]; then
    echo " "
else
    mkdir -p "$ICONS_DIR"
fi

cd /data/data/com.termux/files/home/RazX/Installer-resources/icon
tar -xf icon.tar.xz -C ~/.icons

xfconf-query -c xsettings -p /Net/IconThemeName -s "kora"
jq '.icon = "true"' /data/data/com.termux/files/home/RazX/installer.json > /data/data/com.termux/files/home/RazX/tmp.json && mv /data/data/com.termux/files/home/RazX/tmp.json /data/data/com.termux/files/home/RazX/installer.json
jq '.progress = 28' /data/data/com.termux/files/home/RazX/installer.json > /data/data/com.termux/files/home/RazX/tmp.json && mv /data/data/com.termux/files/home/RazX/tmp.json /data/data/com.termux/files/home/RazX/installer.json


# <--Installing Cursor-->
sleep 2
cd /data/data/com.termux/files/home/RazX/Installer-resources/cursor
tar -xf cursor.tar.gz -C ~/.icons
sleep 2
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "Future-cyan-cursors"
jq '.cursor = "true"' /data/data/com.termux/files/home/RazX/installer.json > /data/data/com.termux/files/home/RazX/tmp.json && mv /data/data/com.termux/files/home/RazX/tmp.json /data/data/com.termux/files/home/RazX/installer.json
jq '.progress = 42' /data/data/com.termux/files/home/RazX/installer.json > /data/data/com.termux/files/home/RazX/tmp.json && mv /data/data/com.termux/files/home/RazX/tmp.json /data/data/com.termux/files/home/RazX/installer.json


# <--Installing Wallpaper-->
WALLPAPER_DIR="/data/data/com.termux/files/usr/share/backgrounds/xfce"

if [ -d "$WALLPAPER_DIR" ]; then
    rm -r /data/data/com.termux/files/usr/share/backgrounds/xfce
    mkdir /data/data/com.termux/files/usr/share/backgrounds/xfce
else
    mkdir /data/data/com.termux/files/usr/share/backgrounds/xfce
fi

cd /data/data/com.termux/files/home/RazX/Installer-resources/wallpaper
cp xfce-x.svg /data/data/com.termux/files/usr/share/backgrounds/xfce
jq '.wallpaper = "true"' /data/data/com.termux/files/home/RazX/installer.json > /data/data/com.termux/files/home/RazX/tmp.json && mv /data/data/com.termux/files/home/RazX/tmp.json /data/data/com.termux/files/home/RazX/installer.json
jq '.progress = 56' /data/data/com.termux/files/home/RazX/installer.json > /data/data/com.termux/files/home/RazX/tmp.json && mv /data/data/com.termux/files/home/RazX/tmp.json /data/data/com.termux/files/home/RazX/installer.json


# <--Installing Panel-->
sleep 2
rm -r /data/data/com.termux/files/home/.config/xfce4/panel
rm -r /data/data/com.termux/files/home/.config/xfce4/xfconf
sleep 3
cp -r /data/data/com.termux/files/home/RazX/Installer-resources/panel/panel /data/data/com.termux/files/home/.config/xfce4/
cp -r /data/data/com.termux/files/home/RazX/Installer-resources/panel/xfconf /data/data/com.termux/files/home/.config/xfce4/
xfce4-panel --restart
jq '.dock = "true"' /data/data/com.termux/files/home/RazX/installer.json > /data/data/com.termux/files/home/RazX/tmp.json && mv /data/data/com.termux/files/home/RazX/tmp.json /data/data/com.termux/files/home/RazX/installer.json
jq '.progress = 70' /data/data/com.termux/files/home/RazX/installer.json > /data/data/com.termux/files/home/RazX/tmp.json && mv /data/data/com.termux/files/home/RazX/tmp.json /data/data/com.termux/files/home/RazX/installer.json


# <--Installing System Bash-->
systemBash_DIR="$HOME/.systemBash"

if [ -d "$systemBash_DIR" ]; then
    rm -r /data/data/com.termux/files/home/.systemBash
    cp -r /data/data/com.termux/files/home/RazX/Installer-resources/.systemBash /data/data/com.termux/files/home/
else
    cp -r /data/data/com.termux/files/home/RazX/Installer-resources/.systemBash /data/data/com.termux/files/home/
fi
jq '.systembash = "true"' /data/data/com.termux/files/home/RazX/installer.json > /data/data/com.termux/files/home/RazX/tmp.json && mv /data/data/com.termux/files/home/RazX/tmp.json /data/data/com.termux/files/home/RazX/installer.json
jq '.progress = 84' /data/data/com.termux/files/home/RazX/installer.json > /data/data/com.termux/files/home/RazX/tmp.json && mv /data/data/com.termux/files/home/RazX/tmp.json /data/data/com.termux/files/home/RazX/installer.json


# <--Installing BashRC-->
sleep 2
BashRc_DIR="$HOME/.bashrc"

if [ -d "$BashRc_DIR" ]; then
    rm -r /data/data/com.termux/files/home/.bashrc
    cp -r /data/data/com.termux/files/home/RazX/Installer-resources/.bashrc /data/data/com.termux/files/home/
else
    cp -r /data/data/com.termux/files/home/RazX/Installer-resources/.bashrc /data/data/com.termux/files/home/
fi
jq '.bashrc = "true"' /data/data/com.termux/files/home/RazX/installer.json > /data/data/com.termux/files/home/RazX/tmp.json && mv /data/data/com.termux/files/home/RazX/tmp.json /data/data/com.termux/files/home/RazX/installer.json
jq '.progress = 100' /data/data/com.termux/files/home/RazX/installer.json > /data/data/com.termux/files/home/RazX/tmp.json && mv /data/data/com.termux/files/home/RazX/tmp.json /data/data/com.termux/files/home/RazX/installer.json

clear
sleep 3
pkill -f xfce4
pkill -f xfwm4
pkill -f xfdesktop
pkill -f xfce4-panel
