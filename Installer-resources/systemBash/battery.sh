#!/bin/sh

battery=$(cat /sys/class/power_supply/battery/capacity)
echo "<txt>🔋 $battery%</txt>"
