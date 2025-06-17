#!/bin/bash

termux-x11 :1 &
export DISPLAY=:1
am start -n com.termux.x11/.MainActivity &
python /data/data/com.termux/files/home/RazX/dependencies/system/boot/main.py &
python /data/data/com.termux/files/home/RazX/Installer-resources/setup/main.py &
xfce4-session
