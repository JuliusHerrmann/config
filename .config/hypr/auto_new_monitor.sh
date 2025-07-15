#!/bin/sh

# Automatically opens bar on second screen
handle() {
  case $1 in
    monitoradded*) eww open bar2 ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
