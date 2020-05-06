#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

function getTitle() {
	if [ "$player_status" = "Playing" ]; then
	    echo $(playerctl metadata title)
	elif [ "$player_status" = "Paused" ]; then
	    echo $(playerctl metadata title)
	else
	    echo "No Available Media"
	fi
}

function mediaPlayPause() {
	status="$(playerctl status 2>/dev/null)"
	if [ "$status"  = 'Paused' ]; then
		echo 
	elif [ "$status" = 'Playing' ]; then
		echo 
	else 
		echo 
	fi
}
