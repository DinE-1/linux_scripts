#### note: "`[value]`" indicates value is optional
# display_backlight_adjust.sh
## Usage:
`script_name [+/-]brightness_percent_to_increase/decrease [-[r][s]]`

arguement2 format:
`-[r][s]`

**r** (short for 'raw'): take arguement 1 value as direct value instead of percentage

**s** (short for 'set'): set the value of arguement 1 as brightness

## Example:
### increases brightness by 10%
`display_backlight_adjust.sh +10`
### sets brightness to 10% of maximum brightness
`display_backlight_adjust.sh 10 -s`
### sets brightness to 10
`display_backlight_adjust.sh 10 -sr`
# battery_percentage.sh
## Usage
`script_name`
## Example
`battery_percentage.sh`
# sound_percentage.sh
## Usage
`script_name`
