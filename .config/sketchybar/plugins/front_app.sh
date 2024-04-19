#!/bin/sh

if [ "$SENDER" = "front_app_switched" ]; then
  NEW="$INFO"

  # REQUIRES JQ INSTALLED
  PREV_COLOR=$(sketchybar --query front_app | jq -r ".icon.color" )

  sketchybar --animate sin 15 --set $NAME \
             icon.color=0x00${PREV_COLOR:4} label.color=0x00ffffff

  sleep .125

  sketchybar --animate sin 15  --set $NAME \
             width=$(( ${#NEW} * 9 + 56 ))
  
  sleep .125
fi

case $NEW in
  "Code")
    ICON_COLOR=0xff0078d7 
    ICON=󰨞
    ;;
  "Firefox")
    ICON_COLOR=0xffFF9500
    ICON=󰈹
    ;;
  "kitty")
    ICON_COLOR=0xff000000
    ICON=
    ;;
  "Music")
    ICON_COLOR=0xfffc3c44 
    ICON=
    ;;
  "Messages")
    ICON_COLOR=0xff53d769
    ICON=󰭹
    ;;
  *)
    ICON_COLOR=0xffff94c6
    ICON=﯂
    ;;
esac

sketchybar --set $NAME \
           icon=$ICON \
           label="$NEW"

sketchybar --set $NAME \
           icon.color=0x00${ICON_COLOR:4}

sketchybar --animate sin 15 --set $NAME \
           icon.color=$ICON_COLOR label.color=0xffffffff background.color=0x22${ICON_COLOR:4}

