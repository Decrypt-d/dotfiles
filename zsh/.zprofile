#!/bin/sh
export HISTSIZE=30000
export SAVEHIST=30000
echo $HISTSIZE

export XDG_CONFIG_HOME=$HOME/.config

#Enable systemd service
#systemctl --user import-environment PATH
#systemctl --user enable bspwm.service
#systemctl --user enable pywal.service
#systemctl --user enable sxhkd.service
#systemctl --user enable polybar.service
#systemctl --user enable compton.service
#systemctl --user enable init.service
#systemctl --user enable monitor.service

#systemctl --user enable xorg.target

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi
