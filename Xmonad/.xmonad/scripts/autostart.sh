#!/bin/sh

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

(sleep 2; run polybar --config=$HOME/.config/polybar/config) &


#change your keyboard if you need it
#setxkbmap -layout be

#cursor active at boot
xsetroot -cursor_name left_ptr &

#starting utility applications at boot time
run variety &
run dunst &
numlockx on &
picom --config $HOME/.xmonad/scripts/picom.conf &
