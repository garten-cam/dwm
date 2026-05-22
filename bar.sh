#!/bin/sh
export IDENTIFIER="unicode"

while true; do
    # 1. Fetch values
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
    STATUS=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null)

    # 2. Safety check: Handle empty variables during logout
    if [ "${STATUS:-Unknown}" = "Charging" ]; then
        BAT=" $CHARGE %"
    else
        BAT=" $CHARGE %"
    fi

    # 3. Update bar. '|| exit' ensures the script dies when X stops.
    xsetroot -name "| $BAT |  $(date +"%R") |" 2>/dev/null || exit
    
    sleep 1m
done
