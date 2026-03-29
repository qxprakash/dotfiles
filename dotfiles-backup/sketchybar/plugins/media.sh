#!/bin/bash
# Media widget script - triggered by media_change_event
# Custom event params are passed as env vars: $title, $artist, $playing

ICON_PLAY="󰎈"
ICON_PAUSE="󰏤"

TITLE="$title"
ARTIST="$artist"
PLAYING="$playing"

# Debug
echo "$(date): TITLE=$TITLE ARTIST=$ARTIST PLAYING=$PLAYING SENDER=$SENDER" >> /tmp/media_debug.log

if [ -z "$TITLE" ]; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

# Truncate long strings
[ ${#TITLE} -gt 25 ] && TITLE="${TITLE:0:22}..."
[ ${#ARTIST} -gt 20 ] && ARTIST="${ARTIST:0:17}..."

if [ "$PLAYING" = "true" ]; then
  ICON="$ICON_PLAY"
else
  ICON="$ICON_PAUSE"
fi

LABEL="${TITLE}"
[ -n "$ARTIST" ] && LABEL="${ARTIST} - ${TITLE}"

sketchybar --set "$NAME" drawing=on \
                         icon="$ICON" \
                         label="$LABEL"
