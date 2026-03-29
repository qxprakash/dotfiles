#!/bin/bash

STATUS=$(ifconfig en0 2>/dev/null | awk '/status:/{print $2}')

if [ "$STATUS" = "active" ]; then
  IP=$(ipconfig getifaddr en0 2>/dev/null)
  LABEL="${IP:-Connected}"
else
  LABEL="No WiFi"
fi

sketchybar -m --set "$NAME" label="$LABEL"
