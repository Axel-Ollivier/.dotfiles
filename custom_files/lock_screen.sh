#!/bin/bash
scrot /tmp/screenshot.png 
convert /tmp/screenshot.png -scale 10% -scale 1000% /tmp/screenshot.png 
i3lock -i /tmp/screenshot.png -f
rm /tmp/screenshot.png