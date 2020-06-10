#!/bin/sh
export HISTSIZE=30000
export SAVEHIST=30000
echo $HISTSIZE

#Enable systemd service
systemctl --user enable bspwm.service
systemctl --user enable pywal.service
systemctl --user enable sxhkd.service
systemctl --user enable polybar.service
systemctl --user enable compton.service

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    export DISPLAY=:0
    systemctl --user import-environment PATH
    systemctl --user import-environment DISPLAY
    systemctl --user enable init.service
    systemctl --user enable monitor.service
    systemctl --user start xorg.target
fi
