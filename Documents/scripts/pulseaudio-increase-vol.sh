#!/bin/sh
current=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/\%//')
[ $current -lt 100 ] && pactl set-sink-volume @DEFAULT_SINK@ +5%
