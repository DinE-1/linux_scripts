#!/bin/bash
battery_info=$(upower -i $(upower -e | grep battery ))
battery_state=$(echo "$battery_info" | grep state | awk '{print $2}')
battery_percentage=$(echo "$battery_info" | grep percentage | awk '{print $2}')

#display for charging and not charging
if [[ "$battery_state" == "charging" ]]; then
	echo "🔌$battery_percentage"
else
	echo "🔋$battery_percentage"
fi
