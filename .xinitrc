#!/bin/sh
#
# ~/.xinitrc
#

export PATH="/home/xla/.local/bin:$PATH"

xset r rate 160 80                   # Sane repeat rate
xset -b                              # No bell
# order: STANDBY SUSPEND OFF
xset dpms 180 210 240                # Energy mode switch in sec
xset s 180 0                         # Sets the timeout for the screen saver in sec
xset m 7/5 0                         # Pointer settings
setxkbmap -option compose:super      # Set compose key to R-Alt

if [ -f ~/.nvidia-settings-rc ]; then
  nvidia-settings --load-config-only;
fi

if [ -f ~/.xbindkeysrc ]; then
  xbindkeys;
fi

if [ -f ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap;
fi

if [ -f ~/.Xresources ]; then
  xrdb -merge ~/.Xresources
fi

xss-lock -- /usr/bin/slock &

exec xmonad
