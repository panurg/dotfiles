#!/bin/sh
transmission-gtk -m &
urxvtd -q -f -o
xset b off
~/.fehbg &
telegram-desktop &
compton -b
spacefm -d &
exec /usr/bin/i3
