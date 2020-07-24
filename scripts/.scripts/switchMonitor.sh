#!/bin/bash

MonitorSwitchX=1080

prevLocX=`xdotool getmouselocation | grep -o "x:[0-9]* " | grep -o "[^x:].*"`
prevLocY=`xdotool getmouselocation | grep -o "y:[0-9]* " | grep -o "[^y:].*"`
curLocX=$prevLocX
curLocY=$prevLocY

monitor1Top=0
monitor1RangeToBottom=1440
monitor2Top=423
monitor2RangeToBottom=1081

while true; do
    curLocX=`xdotool getmouselocation | grep -o "x:[0-9]* " | grep -o "[^x:].*"`
    curLocY=`xdotool getmouselocation | grep -o "y:[0-9]* " | grep -o "[^y:].*"`
    if [ $prevLocX -lt $MonitorSwitchX ] && [ $curLocX -gt $MonitorSwitchX ]; then
        mouseOffset=`echo "scale=3;(($curLocY - $monitor2Top) / $monitor2RangeToBottom) * $monitor1RangeToBottom" | bc`
        newMouseY=`echo "$mouseOffset + $monitor1Top" | bc`
        xdotool mousemove $curLocX $newMouseY
    elif [ $prevLocX -gt $MonitorSwitchX ] && [ $curLocX -lt $MonitorSwitchX ]; then
        mouseOffset=`echo "scale=3;(($curLocY - $monitor1Top) / $monitor1RangeToBottom) * $monitor2RangeToBottom" | bc`
        newMouseY=`echo "$mouseOffset + $monitor2Top" | bc`
        xdotool mousemove $curLocX $newMouseY
    fi
    prevLocX=$curLocX
    prevLocY=$curLocY
done
