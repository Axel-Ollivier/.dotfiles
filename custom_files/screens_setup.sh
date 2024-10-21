#!/bin/bash

# First, set up the screen layout
xrandr --output DP-1 --auto --below eDP-1

if xrandr | grep "HDMI-3 connected"; then
    xrandr --output HDMI-3 --auto --left-of eDP-1
    xrandr --output HDMI-3 --primary
else
    xrandr --output eDP-1 --primary
fi

if xrandr | grep "DP-2 connected"; then
    xrandr --output DP-2 --auto --left-of HDMI-3
fi

# Now assign workspaces based on which monitors are connected
if xrandr | grep "DP-2 connected"; then
    # DP-2 is connected, apply full setup
    i3-msg "workspace 1; move workspace to output DP-2"
    i3-msg "workspace 2; move workspace to output HDMI-3"
    i3-msg "workspace 3; move workspace to output eDP-1"
    i3-msg "workspace 0; move workspace to output DP-1"
elif xrandr | grep "HDMI-3 connected"; then
    # HDMI-3 is connected, but DP-2 is not
    i3-msg "workspace 1; move workspace to output HDMI-3"
    i3-msg "workspace 2; move workspace to output eDP-1"
    i3-msg "workspace 0; move workspace to output DP-1"
else
    # Only eDP-1 and DP-1 are connected
    i3-msg "workspace 1; move workspace to output eDP-1"
    i3-msg "workspace 0; move workspace to output DP-1"
fi
