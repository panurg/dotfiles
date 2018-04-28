#!/bin/sh
$HOME/.screenlayout/double.sh
urxvtd -q -f -o
xset b off
~/.fehbg &
telegram-desktop &
slack &
compton &
spacefm -d &
davmail &
exec /usr/bin/i3
