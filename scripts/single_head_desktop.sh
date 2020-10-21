#!/bin/bash
xrandr \
    --output LVDS-1 --primary --mode 1280x800 --pos 0x656 --rotate normal \
    --output DP-1 --off \
    --output HDMI-1 --off \
    --output VGA-1 --off
