#!/usr/bin/env bash
LOCKFILE=~/.config/eww/scripts/brightlock

brightnessctl s 10%-
eww update brightness=true
eww update brightness_level=$(brightnessctl g)

echo $EPOCHSECONDS > $LOCKFILE
sleep 3.1s

if (($EPOCHSECONDS - $(cat $LOCKFILE) >= 3)); then
	eww update brightness=false
fi
