#!/bin/bash
function status (){
	add_spaces "25" "$(printf "%s   %s " "$(date +%H:%M)" "$(date +%d.%m.%y)")"
	#volume
	if [ "$(pactl list sinks | grep "Mute:" | tail -c 2)" = "o" ]; then
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
	#wifi
	if [ -n "$(iwgetid -r)" ]; then
		ssid="$(iwgetid -r)"
		ssidcut=${ssid:0:10}
		add_spaces "15" "$ssidcut "
	else
		add_spaces "15" "No conn. "
	fi
	#echo "  "
	#battery
	add_spaces "6" "$(cat /sys/class/power_supply/BAT0/capacity)"
	#echo ""
}

function add_spaces (){
	printf "%+$1s" "$2"
}

function add_Clock(){
	#clock = date +%H:%M
	#for ((n=0;n<5;n++))
	#do
		#clock = "clock "
	#done
	#echo "$clock" "$status"
	printf "%s    %s " "$(date +%H:%M)" "$(date +%d.%m.%y)"
	#printf '%+192s' "$(status)"
	printf '%+55s' "$(status)"
}

while true; do
	xsetroot -name "$(status | tr '\n' ' ')"
	#add_spaces "13" "Tealksjdst"
	#add_spaces "13" "Tie"
	sleep 2
done

##!/bin/bash
#function status (){
#	add_spaces "25" "$(printf " %s   %s" "$(date +%H:%M)" "$(date +%d.%m.%y)")"
#	#volume
#	add_spaces "9" " $(pactl list sinks | grep '^[[:space:]]Volume:' | \
#		head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')"
#	#echo "  "
#	#cpu
#	#"$(echo `top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`"%") /"
#	#echo "/"
#	add_spaces "18" " $(echo `top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`"%")/$(sensors | grep -A 0 'Package' | cut -c17-23)"
#	#echo "  "
#	#wifi
#	if [ -n "$(iwgetid -r)" ]; then
#		add_spaces "15" " $(iwgetid -r)"
#	else
#		add_spaces "15" " No conn."
#	fi
#	#echo "  "
#	#battery
#	add_spaces "1" " $(cat /sys/class/power_supply/BAT0/capacity)"
#	#echo ""
#}
#
#function add_spaces (){
#	printf "%-$1s" "$2"
#}

#function add_Clock(){
#	#clock = date +%H:%M
#	#for ((n=0;n<5;n++))
#	#do
#		#clock = "clock "
#	#done
#	#echo "$clock" "$status"
#	printf "%s    %s " "$(date +%H:%M)" "$(date +%d.%m.%y)"
#	#printf '%+192s' "$(status)"
#	printf '%+55s' "$(status)"
#}
#
#while true; do
#	xsetroot -name "$(status | tr '\n' ' ')"
#	#add_spaces "13" "Tealksjdst"
#	#add_spaces "13" "Tie"
#	sleep 2
#done
