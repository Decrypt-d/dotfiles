#!/bin/bash

if [ $(xrandr -q | grep -w connected | wc -l) -gt 1 ]; then 
	secondary_monitors=$(xrandr -q | grep -v primary | grep -w connected | cut -d ' ' -f 1) 
	for m in $secondary_monitors 
	do
		MONITOR=$m polybar --reload secondary_bar &
	done
fi
primary_monitor=$(xrandr -q | grep primary | cut -d ' ' -f 1)
MONITOR=$primary_monitor polybar --reload bspwm & 
MONITOR=$primary_monitor polybar --reload music & 
MONITOR=$primary_monitor polybar --reload tray &
