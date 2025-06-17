#!/bin/bash

INTERFACE=wlan0  # change if needed (e.g., rmnet_data0 or eth0)
TMPFILE="/data/data/com.termux/files/home/.net_down.tmp"

# Read current received bytes
read_bytes=$(awk -v iface="$INTERFACE" '$0 ~ iface {print $2}' /proc/net/dev)
curr_time=$(date +%s)

if [ -f "$TMPFILE" ]; then
    . "$TMPFILE"  # load: last_read, last_time
    dt=$((curr_time - last_time))

    if [ "$dt" -gt 0 ]; then
        rate=$(( (read_bytes - last_read) / dt ))

        # Format speed
        if [ "$rate" -ge 1048576 ]; then
            speed=$(awk "BEGIN {printf \"%.1f MB/s\", $rate/1048576}")
        elif [ "$rate" -ge 1024 ]; then
            speed=$(awk "BEGIN {printf \"%.1f KB/s\", $rate/1024}")
        else
            speed="${rate} B/s"
        fi

        echo "<txt>ᯤ $speed</txt>"
    fi
fi

# Save current state
echo "last_read=$read_bytes" > "$TMPFILE"
echo "last_time=$curr_time" >> "$TMPFILE"
