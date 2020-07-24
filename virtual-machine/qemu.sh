#!/bin/sh

#Location /etc/libvirt/hooks/qemu

#Hooks for libvirt to run when starting or reverting back from win10 virtual machine
# Script for win10
if [[ $1 == "win10" ]]; then
   if [[ $2 == "prepare" ]]; then
	/bin/vfio-start.sh
   fi

   if [[ $2 == "release" ]]; then
	/bin/vfio-revert.sh
   fi
fi
