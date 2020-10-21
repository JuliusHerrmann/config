#!/bin/bash
function status (){
	add_spaces "25" "$(printf "%s   %s " "$(date +%H:%M)" "$(date +%d.%m.%y)")"
	#volumeq
	#if [ "$(pactl list sinks | grep "Mute:" | head -2 | tail -1 | tail -c 2)" = "o" ]; then
		#add_spaces "9" "$(pactl list sinks | grep '^[[:space:]]Volume:' | \
			#head -n $(( $SINK + 2 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,') "
	#else
		#add_spaces "9" "--- "
	#fi
	SINK="$(pactl list sinks short|grep `pactl info|grep "Default Sink: "| sed 's/.*: //g'`|head -c 1)"
	if [ "$(pactl list sinks | grep "Mute:" | head -2 | tail -1 | tail -c 2)" = "o" ]; then
		add_spaces "9" "$(pactl list sinks | grep '^[[:space:]]Volume:' | \
			head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,') "
	else
		add_spaces "9" "--- "
	fi
	#add_spaces "9" "$(pactl list sinks | grep '^[[:space:]]Volume:' | \
		#head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,') "
	#echo "  "
	#cpu
	#"$(echo `top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`"%") /"
	#echo "/"
	add_spaces "18" "$(echo `top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`"%")/$(sensors | grep -A 0 'Package' | cut -c17-23) "
	#echo "  "
}

function add_spaces (){
	printf "%+$1s" "$2"
}

while true; do
	xsetroot -name "$(status | tr '\n' ' ')"
	#add_spaces "13" "Tealksjdst"
	#add_spaces "13" "Tie"
	sleep 2
done
