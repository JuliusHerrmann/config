cd ~
sxhkd -c .config/sxhkd/sxhkdrc_dwm &
udiskie &
batsignal &
picom --experimental-backends &
caffeine &
./.fehbg &
#./.config/polybar/launch.sh &
#Screen lock
xset s 600 600 &
xss-lock lockscreen -l &
#Fix X shaped xursor
xsetroot -cursor_name left_ptr
#Touchpad
xinput --set-prop "SYNA32A0:00 06CB:CE14 Touchpad" "libinput Accel Speed" -1
xinput --set-prop "SYNA32A0:00 06CB:CE14 Touchpad" "libinput Tapping Enabled" 1
xinput --set-prop "SYNA32A0:00 06CB:CE14 Touchpad" "libinput Natural Scrolling Enabled" 1
xinput --set-prop "SYNA32A0:00 06CB:CE14 Touchpad" "Coordinate Transformation Matrix" 18, 0, 0, 0, 18, 0, 0, 0, 1

setxkbmap de neo_qwertz
setxkbmap -option
xcape -e 'ISO_Level3_Shift=Escape' -t 200
xset r rate 300 40 &

#Start the bar
./.config/dwm/dwmbar.sh &
