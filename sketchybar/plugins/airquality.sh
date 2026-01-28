#!/bin/bash

GREEN=0xffa6da95
YELLOW=0xffeed49f
ORANGE=0xfff5a97f
RED=0xffed8796
PURPLE=0xffc6a0f6
MAROON=0xffab4257

# Change "here" to city name
AIRQUALITY_DATA=$(curl -s --request GET --url "http://api.waqi.info/feed/here/?token=f169117bfa5d4b525d22273cc2fe2764a772e74d")

AQI=$(echo "$AIRQUALITY_DATA" | grep -o '"aqi":[[:space:]]*[0-9]*' | grep -o '[0-9]*')

sketchybar --set "$NAME" label="$AQI"

# if [ -n "$AQI" ]; then
    if [ "$AQI" -le 50 ]; then
        COLOR=$GREEN
    elif [ "$AQI" -le 100 ]; then
        COLOR=$YELLOW
    elif [ "$AQI" -le 150 ]; then
        COLOR=$ORANGE
    elif [ "$AQI" -le 200 ]; then
        COLOR=$RED
    elif [ "$AQI" -le 300 ]; then
        COLOR=$PURPLE
    else
        COLOR=$MAROON
    fi

    sketchybar --set "$NAME" label="$AQI" \
                    icon.color="$COLOR" \
                    label.color="$COLOR" \
                    background.border_color="$COLOR"
# else
#     sketchybar --set "$NAME" label=".."
fi