#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# rofi -no-config -no-lazy-grab -show emoji -modi emoji -emoji-format '{emoji}' -font "Noto sans 30" -theme ~/.xmonad/launcher/rofi/launcher.rasi
rofi -no-config -no-lazy-grab -show emoji -modi emoji -emoji-format '{emoji} <span size="xx-small">{keywords}</span>' -font "Noto sans 30" -theme ~/.xmonad/launcher/rofi/launcher.rasi
