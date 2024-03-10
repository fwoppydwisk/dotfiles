#!/usr/bin/env bash

# Count the number of connected monitors
connected_monitors=$(xrandr | grep " connected " | wc -l)
# Check if more than one monitor is connected
if [ $connected_monitors -gt 1 ]; then
    # Disable LVDS-1
    hyprctl keyword monitor LVDS-1, disable
else
    # Send computer to sleep
    swayidle -w \
    timeout 1800 'hyprctl dispatch dpms off' \
    resume 'hyprctl dispatch dpms on' \
    timeout 3600 'systemctl suspend'
fi
