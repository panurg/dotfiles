#!/bin/sh
exec transmission-gtk -m
exec urxvtd -q -f -o
exec xset b off
~/.fehbg &
telegram-desktop &
compton -b
spacefm -d &
exec /usr/bin/i3
