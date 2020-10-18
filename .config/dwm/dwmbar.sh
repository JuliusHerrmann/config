#!/bin/bash
function status (){
	#volume
	pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'
	echo "  "
	#cpu
	echo `top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`"%"
	echo "/"
	sensors | grep -A 0 'Package' | cut -c17-23
	echo "  "
	#wifi
	iwgetid -r
	echo "  "
	#battery
	cat /sys/class/power_supply/BAT0/capacity
	echo ""
}

function addClock(){
	#clock = date +%H:%M
	#for ((n=0;n<5;n++))
	#do
		#clock = "clock "
	#done
	#echo "$clock" "$status"
	printf "%s" "$(date +%H:%M)"
	printf '%+123s' "$(status)"
}

while true; do
	xsetroot -name "$(addClock | tr '\n' ' ')"
	sleep 2
done
