#!/usr/bin/bash

# Never fully kill Steam with a keybind, allowing it to minimize to tray
if [ "$(hyprctl activewindow -j | jq -r ".class")" = "Steam" ]; then
    xdotool getactivewindow windowunmap
else
    hyprctl dispatch killactive ""
fi
