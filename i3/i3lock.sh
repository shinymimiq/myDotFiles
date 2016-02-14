#!/bin/sh
scrot /tmp/screen_locked.png
convert /tmp/screen_locked.png -blur 10x10 /tmp/screen_locked2.png
# mogrify -scale 10% -scale 1000% /tmp/screen_locked.png
i3lock -i /tmp/screen_locked2.png
# Turn the screen off after a delay.
sleep 60; pgrep i3lock && xset dpms force off
