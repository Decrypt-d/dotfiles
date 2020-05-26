#Run xbindkeys to bind mouse keys
/usr/bin/xbindkeys

#Increase keyboard output rate
/usr/bin/xset r rate 155 14
alias mailspring='snap run mailspring'

#Add pywal support
which wal && wal -R

if [ $(xrandr -q | grep -w connected | wc -l) -gt 1 ]; then
	xrandr --output USB-C-0 --primary --output DP-0 --rotate left --left-of USB-C-0
fi
