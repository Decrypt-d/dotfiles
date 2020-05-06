#! /bin/bash

selectedOption=$(echo -e "	Sleep\n	Shutdown" | rofi -dmenu -p "Options" \
-xoffset -2 -yoffset 40 \
-location 3 \
-hide-scrollbar true \
-color-enabled true \
-font "Fantasque Sans Mono 12" \
-config /home/danh/.config/rofi/shutdown.rasi)

if [ "$selectedOption" = '	Sleep' ]; then 
	systemctl suspend
elif [ "$selectedOption" = '	Shutdown' ]; then 
	poweroff
fi
