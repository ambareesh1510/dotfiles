#!/usr/bin/env bash
LOCKFILE=~/.config/eww/scripts/vollock

pactl set-sink-volume @DEFAULT_SINK@ +10%
eww update volume=true
eww update volume_level=$(~/.config/eww/scripts/getvol)

echo $EPOCHSECONDS > $LOCKFILE
sleep 3.1s

if (($EPOCHSECONDS - $(cat $LOCKFILE) >= 3)); then
	eww update volume=false
fi

