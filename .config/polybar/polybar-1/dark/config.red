;==========================================================
;
;
;   ██████╗  ██████╗ ██╗  ██╗   ██╗██████╗  █████╗ ██████╗
;   ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
;   ██████╔╝██║   ██║██║   ╚████╔╝ ██████╔╝███████║██████╔╝
;   ██╔═══╝ ██║   ██║██║    ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗
;   ██║     ╚██████╔╝███████╗██║   ██████╔╝██║  ██║██║  ██║
;   ╚═╝      ╚═════╝ ╚══════╝╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
;
;
;   Modified By Aditya Shakya.
;
;==========================================================

[color]

trans = #00000000
white = #FFFFFF
black = #000000

bg = #1F1F1F
fg = #FFFFFF
fg-alt = #A9ABB0

acolor = #e53935
curgent = #43a047
coccupied = #1e88e5

## Material Colors

red = #e53935
pink = #d81b60
purple = #8e24aa
deep-purple = #5e35b1
indigo = #3949ab
blue = #1e88e5
light-blue = #039be5
cyan = #00acc1
teal = #00897b
green = #43a047
light-green = #7cb342
lime = #c0ca33
yellow = #fdd835
amber = #ffb300
orange = #fb8c00
deep-orange = #f4511e
brown = #6d4c41
grey = #757575
blue-gray = #546e7a

;==========================================================

[bar/main]
monitor = LVDS1
width = 90%
height = 40
offset-x = 5%
offset-y = 2%
bottom = true
fixed-center = false
line-size = 2

background = ${color.bg}
foreground = ${color.fg}

border-size = 3
border-color = ${color.bg}

module-margin-left = 1
module-margin-right = 1

;==========================================================

font-0 = "Fantasque Sans Mono:pixelsize=12;2"
font-1 = "Material Icons:size=13;4"

;==========================================================

cursor-click = pointer
cursor-scroll = ns-resize

;tray-position = right
;tray-padding = 0
;tray-maxsize = 16

scroll-up = i3wm-wsnext
scroll-down = i3wm-wsprev

;== Module Location ========================================================

modules-left = arch workspaces term files browser settings
modules-right = mpd pkg volume battery network date powermenu
 
;== Modules ========================================================

[module/arch]
type = custom/text
content = 
;alt-icon = 
content-padding = 2
content-background = ${color.acolor}
content-foreground = ${color.fg}
click-left = rmenu_g
click-middle = rfull
click-right = rmenu_wi_g

[module/workspaces]
type = internal/xworkspaces
pin-workspaces = false
enable-click = true
enable-scroll = true
format-padding = 0

icon-0 = 1;
icon-1 = 2;
icon-2 = 3;
icon-3 = 4;
;icon-4 = 5;
icon-default = 

format = <label-state>
label-active = %icon%
label-occupied = %icon%
label-urgent = %icon%
label-empty = %icon%

label-occupied-padding = 2
label-empty-padding = 2
label-urgent-padding = 2
label-active-padding = 2

label-active-foreground = ${color.acolor}
label-urgent-foreground = ${color.curgent}
label-empty-foreground = ${color.fg}
label-occupied-foreground = ${color.coccupied}

label-active-underline = ${color.acolor}
label-urgent-underline = ${color.curgent}
label-occupied-underline = ${color.coccupied}

[module/term]
type = custom/text
content = 
content-foreground = ${color.fg-alt}
click-left = termite &
click-middle = urxvt &
click-right = xfce4-terminal &

[module/files]
type = custom/text
content = 
content-padding = 1
content-foreground = ${color.fg-alt}
click-left = thunar &
click-right = ranger &

[module/browser]
type = custom/text
content = 
content-padding = 1
content-foreground = ${color.fg-alt}
click-left = chromium &
click-right = firefox &

[module/settings]
type = custom/text
content = 
content-padding = 1
content-foreground = ${color.fg-alt}
click-left = xfce4-settings &
click-right = lxappearance &

;==========================================================

[module/mpd]
type = internal/mpd
;format-online = <toggle> <label-song> 
format-online =  <label-song> 

icon-play = 
icon-pause = 

label-song-maxlen = 25
label-song-ellipsis = true

;==========================================================

[module/pkg]
type = custom/script
exec = updates.sh
;exec-if = "ping -q -w 2 -c 1 176.34.135.167 > /dev/null"
;label = %{A1:termite -e "aurman -Syyu" & disown:} %{A3:termite -e "aurman -Syyu" & disown:}%output%%{A} %{A}
tail = true

[module/battery]
type = internal/battery
full-at = 99
time-format = %H:%M
battery = BAT1
adapter = AC
format-charging = <animation-charging> <label-charging>
;label-charging = %percentage%% (%time%)
label-charging = %percentage%%
format-discharging = <ramp-capacity> <label-discharging>
;label-discharging = %percentage%% (%time%)
label-discharging = %percentage%%
format-full = <label-full>

format-full-prefix = " "
ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 

ramp-capacity-0-foreground = ${color.red}
ramp-capacity-foreground   = ${color.fg}
bar-capacity-width = 10

animation-charging-0 = ""
animation-charging-1 = ""
animation-charging-2 = ""
animation-charging-3 = ""
animation-charging-4 = ""

animation-charging-framerate = 750

[module/volume]
type = internal/alsa
;speaker-mixer = Speaker
;headphone-mixer = Headphone
;headphone-id = 16
;mapped = true
format-volume = <ramp-volume> <label-volume>
label-volume = %percentage%%
format-muted-prefix = " "
label-muted = MUTE

ramp-volume-0 = 
ramp-volume-1 = 
ramp-volume-2 = 
ramp-volume-3 = 
ramp-volume-4 = 
ramp-volume-5 = 
ramp-volume-6 = 

[module/network]
type = custom/script
exec = check-network
click-left = networkmanager_dmenu &
click-right = networkmanager_dmenu &
tail = true

[module/date]
type = internal/date
interval = 30
label =  %time%
time =  %H:%M %p
time-alt =  %Y-%m-%d

[module/powermenu]
type = custom/text
content = 
content-padding = 2
content-background = ${color.acolor}
content-foreground = ${color.fg}
click-left = pmenu_g
click-right = pmenu_g

;== EOF ========================================================
