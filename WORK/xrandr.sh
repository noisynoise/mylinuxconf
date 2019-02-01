#!/bin/bash
# set -x

LEFT_SCREEN="DP-2-2"
MID_SCREEN="DP-2-1"
RIGHT_SCREEN="DP-2-3"
LAPTOP_SCREEN="eDP-1"

DEF_CONF="/home/zmvw4098/.config/i3/config"
LAPTOP_CONF="/home/zmvw4098/.config/i3/config-laptop"
MH_CONF="/home/zmvw4098/.config/i3/config-MH"

desktop_layout(){
xrandr --output DP-2-3 --auto --mode 1920x1200 --pos 0x0 --output eDP-1 --mode 1920x1080   --pos 1920x400 --output DP-2-2 --mode 1680x1050 --left-of DP-2-3 
# sleep 2
xrandr --output eDP-1 --off
sleep 2
xrandr --output DP-2-1 --mode 1920x1080 --right-of DP-2-3 --rotate left
sleep 2 
# ADJUSTING ECH SCREEN POSITION ON VIRTUAL SCR33N TO MATCH THEIR PHYSICAL POSITION
xrandr --output DP-2-2 --mode 1680x1050 --pos 0x650  --output DP-2-3 --mode 1920x1200 --pos 1680x500 --output DP-2-1  --pos 3600x0
}

no_desktop(){
for screen in $LEFT_SCREEN $MID_SCREEN $RIGHT_SCREEN
do
  xrandr --output $screen --off
done
xrandr --output eDP-1 --auto
}

copy-configMH(){
cp $MH_CONF $DEF_CONF
i3 restart
}

copy-config_laptop(){
cp $LAPTOP_CONF $DEF_CONF
i3 restart
}


PS3="Screen setup :"
choices=("desktop layout" "no desktop" "Quit")
select layout in "${choices[@]}"
do
	case $layout in
		"desktop layout")
			desktop_layout
			copy-configMH
			break
			;;
		"no desktop")
			no_desktop
			copy-config_laptop
			break
			;;
		"Quit")
			break
			;;
		*) echo "invalid choice";;
	esac
done


