cd ~
xrandr --output DP-0 --mode 3440x1440 -r 99.98
sxhkd -c .config/sxhkd/sxhkdrc_dwm &
udiskie &
batsignal &
picom &
caffeine &
./.fehbg &
#./.config/polybar/launch.sh &
#Screen lock
xset s 600 600 &
xss-lock lockscreen -l &
#Fix X shaped xursor
xsetroot -cursor_name left_ptr
#Touchpad
xinput --set-prop "ELAN1300:00 04F3:3057 Touchpad" "libinput Accel Speed" -1
xinput --set-prop "ELAN1300:00 04F3:3057 Touchpad" "libinput Tapping Enabled" 1
xinput --set-prop "ELAN1300:00 04F3:3057 Touchpad" "libinput Natural Scrolling Enabled" 1
xinput --set-prop "ELAN1300:00 04F3:3057 Touchpad" "Coordinate Transformation Matrix" 18, 0, 0, 0, 18, 0, 0, 0, 1

setxkbmap -option caps:escape &
xset r rate 300 40 &

#Start the bar
./.config/dwm/dwmbar.sh &
