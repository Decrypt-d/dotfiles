#!/bin/sh

which wal >/dev/null 2>&1 && wal -R

systemd-notify --ready
