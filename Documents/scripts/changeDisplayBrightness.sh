#!/bin/bash
file="/sys/class/backlight/intel_backlight/brightness"
max=24000
min=10
start=$(cat "$file")
if [ $1 = "--help" ]; then
    echo "Usage:\t --help\tshow this message\n\t--increase number\tincrease brightness by number%\n\t--decrease number\tYou figure it out ;)"
elif [ $1 = "--increase" ]; then
    temp=$(expr $max / $2);
    number="$(expr $start + $temp)"
    if [ $number -gt $max ]; then
        echo $number
        echo $temp
        echo $start
        number=$max
    fi
    echo $number > /sys/class/backlight/intel_backlight/brightness;
elif [ $1 = "--decrease" ]; then
    temp=$(expr $max / $2);
    number="$(expr $start - $temp)"
    if [ $min -gt $number ]; then
        echo $number
        echo $temp
        echo $start
        number=$min
    fi
    echo $number > /sys/class/backlight/intel_backlight/brightness;
fi
