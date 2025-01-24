#!/bin/bash

if [[ -z "$1" || ! "$1" =~ ^-?[0-9]+$ ]]; then
	echo "Usage : $0 <[+ or -]inc or dec percentage >"
	echo "Example: $0 10 (to increase brightness by 10%)"
	exit 1
fi

#path where backlight file is located
backlight_dir=/sys/class/backlight/intel_backlight

#get max supported brightness value
max_brightness=$(cat "$backlight_dir"/max_brightness)
#current brightness
current_brightness=$(cat $backlight_dir/brightness)

brightness_change_value=$1
##detecting if percentage or not
#if there no is 'r'(short for raw) treat first arguement as percentage, else as direct value to write in brightness file
if [[ "$2" == "-"*"r"* ]]; then
	brightness_change=$((brightness_change_value))
else
	brightness_change=$((max_brightness*brightness_change_value/100))
fi

#set the current brightness var value
if [[ "$2" == "-"*"s"* ]]; then
	current_brightness=$((brightness_change))
else
	current_brightness=$((current_brightness+brightness_change))
fi

##brightness limit control
#set brightness to 0 if current brightness is negative
if [[ $current_brightness -lt 0 ]]; then
	current_brightness=0
fi
#set brightness to max brightness if current brightness is greater than max brightness
if [[ $current_brightness -gt $max_brightness ]]; then
	current_brightness=$((max_brightness))
fi

#write the brightness to file
echo $current_brightness > $backlight_dir/brightness
