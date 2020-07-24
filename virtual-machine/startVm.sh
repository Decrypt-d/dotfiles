#!/bin/sh

if [ -z $1 ]; then
    "Please enter the name of the user as argument"
fi

sudo -u $1 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/`id -u $1`/bus systemctl --user stop xorg.target

while [ "$(sudo -u $1 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/`id -u $1`/bus systemctl --user is-active xorg@0.service)" = 'active' ] 
do
    sleep 0.5
done

virsh start win10
