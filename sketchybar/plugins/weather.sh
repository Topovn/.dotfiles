#!/bin/sh

sketchybar --set "$NAME" label="......."

WEATHER_DATA=$(curl -s -m 5 "wttr.in/?format=%t")
CURL_STATUS=$?

# if [ $CURL_STATUS -eq 0 ] && [ -n "$WEATHER_DATA" ]; then
if [ $CURL_STATUS -eq 0 ] && [[ $WEATHER_DATA =~ ^[+-]?[0-9] ]]; then
    sketchybar --set "$NAME" icon="􂬮" label="${WEATHER_DATA}"
  else
    sketchybar --set "$NAME" icon="􂬮" label="N/A"
fi