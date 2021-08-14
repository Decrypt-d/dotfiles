#!/bin/sh

if which xrandr >/dev/null 2>&1; then
    if [ $(xrandr -q | grep -w connected | wc -l) -gt 1 ]; then
    	xrandr --output USB-C-0 --pos 1080x0 --primary --output DP-0 --left-of USB-C-0 --pos 0x0
    else
        xrandr --output USB-C-0 --pos 0x0 --mode 5120x1440
    fi
fi
