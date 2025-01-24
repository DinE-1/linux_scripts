#!/bin/bash
#get the percent of volume
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{$1="";print $0}')
volume_percent=$(( $(echo $volume | awk '{print int($1*100)}') ))

if [ "$(echo $volume | grep MUTE)" == "" ]; then
	sound_level=$(( volume_percent / 33 ))
	speaker=$(echo "📢$( printf "%s" $(yes \) | head -n $sound_level) )")

else
	speaker=🔇
fi

echo "$speaker $volume_percent%"
