#!/bin/bash

if [ -d /etc/X11/xinit/xinitrc.d; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# load .Xresources
xrdb -merge $HOME/.Xresources

# enable restart X
setxkbmap -option terminate:ctrl_alt_bksp

# disable CapsLock & map to Escape
#setxkbmap -option caps:swapescape

# compose key
setxkbmap -option compose:ralt

xsetroot -cursor_name left_ptr &

vmware-user

# launch dwm
exec $HOME/Scripts/dwm-start
