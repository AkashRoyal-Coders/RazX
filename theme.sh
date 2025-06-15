#!/bin/bash

clear

echo -e "\e[32m[*] Installing Theme..."

THEMES_DIR="$HOME/.themes"

if [ -d "$THEMES_DIR" ]; then
    echo " "
else
    mkdir -p "$THEMES_DIR"
fi

cd resources/theme
tar -xf theme.tar.xz -C ~/.themes

xfconf-query -c xsettings -p /Net/ThemeName -s "Fluent-round-Dark"

echo -e "\e[35mTheme Installed Successfully ✓"
sleep 2
ICONS_DIR="$HOME/.icons"

if [ -d "$ICONS_DIR" ]; then
    echo " "
else
    mkdir -p "$ICONS_DIR"
fi

cd
cd RazX/resources/icon
tar -xf icon.tar.xz -C ~/.icons

xfconf-query -c xsettings -p /Net/IconThemeName -s "kora"

echo -e "\e[35mIcon Theme Installed Successfully ✓"
sleep 2
cd
cd RazX/resources/cursor
tar -xf cursor.tar.gz -C ~/.icons

echo -e "\e[35mCursor Theme Installed Successfully ✓"
sleep 2
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "Future-cyan-cursors"

WALLPAPER_DIR="/data/data/com.termux/files/usr/share/backgrounds/xfce"

if [ -d "$WALLPAPER_DIR" ]; then
    rm -r /data/data/com.termux/files/usr/share/backgrounds/xfce
    mkdir /data/data/com.termux/files/usr/share/backgrounds/xfce
else
    mkdir /data/data/com.termux/files/usr/share/backgrounds/xfce
fi

cd
cd RazX/resources/wallpaper
cp xfce-x.svg /data/data/com.termux/files/usr/share/backgrounds/xfce

echo -e "\e[35mWallpaper Installed Successfully ✓"
sleep 2
cd
cd RazX/resorces/panel
tar -czvf panel.tar.gz -C ~/ xfce4-panel-backup
cp -r ~/xfce4-panel-backup/panel ~/.config/xfce4/
cp -r ~/xfce4-panel-backup/xfconf ~/.config/xfce4/
xfce4-panel --restart

systemBash_DIR="$HOME/.systemBash"

if [ -d "$systemBash_DIR" ]; then
    rm -r /data/data/com.termux/files/home/.systemBash
    cd /data/data/com.termux/files/home/RazX/resources
    cp -r .systemBash /data/data/com.termux/files/home/
else
    cd /data/data/com.termux/files/home/RazX/resources
    cp -r .systemBash /data/data/com.termux/files/home/
fi

echo -e "\e[35mDock Theme Installed Successfully ✓"
sleep 2
BashRc_DIR="$HOME/.bashrc"

if [ -d "$BashRc_DIR" ]; then
    rm -r /data/data/com.termux/files/home/.bashrc
    cd /data/data/com.termux/files/home/RazX/resources
    cp -r .bashrc /data/data/com.termux/files/home/
else
    cd /data/data/com.termux/files/home/RazX/resources
    cp -r .bashrc /data/data/com.termux/files/home/
fi

echo -e "\e[35mBashRC Installed Successfully ✓"
sleep 2
clear
echo -e "\e[32m[✓] Theme Installed Successfully"
sleep 2
clear
echo -e "\e[32m[✓] RazX OS V1.11 Installed Successfully"
echo ""
sleep 0.3
echo -e "\e[35mRazX OS Is New If You Getting Any Problem So Please Don't Upset"
sleep 0.3
echo -e "\e[35m Report The Problem In akashgamingboy2@gmail.com We Fix That Problem In Next Update."
sleep 0.3
echo -e "\e[34mPlease Restart Your Termux!, and Enjoy RazX OS V1.11."

