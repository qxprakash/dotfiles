#!/bin/bash

LOCK="/tmp/sketchybar-network.lock"
mkdir "$LOCK" 2>/dev/null || exit 0
trap 'rmdir "$LOCK"' EXIT

INTERFACE="en0"
CACHE_FILE="/tmp/sketchybar_net_${INTERFACE}"

STATS=$(netstat -ibn | awk "/^${INTERFACE}[[:space:]].*<Link#/ {print \$7, \$10; exit}")
CURR_IN=$(echo "$STATS" | awk '{print $1}')
CURR_OUT=$(echo "$STATS" | awk '{print $2}')

if [ -z "$CURR_IN" ] || [ -z "$CURR_OUT" ]; then
  sketchybar --set network label="- -"
  exit 0
fi

format_speed() {
  local bytes=$1
  if [ "$bytes" -gt 1048576 ] 2>/dev/null; then
    awk "BEGIN {printf \"%.1f MB\", $bytes/1048576}"
  elif [ "$bytes" -gt 1024 ] 2>/dev/null; then
    awk "BEGIN {printf \"%.0f KB\", $bytes/1024}"
  else
    awk "BEGIN {printf \"%.0f B\", $bytes}"
  fi
}

if [ -f "$CACHE_FILE" ]; then
  PREV_IN=$(awk '{print $1}' "$CACHE_FILE")
  PREV_OUT=$(awk '{print $2}' "$CACHE_FILE")

  DOWN=$(( (CURR_IN - PREV_IN) / 2 ))
  UP=$(( (CURR_OUT - PREV_OUT) / 2 ))

  [ "$DOWN" -lt 0 ] 2>/dev/null && DOWN=0
  [ "$UP" -lt 0 ] 2>/dev/null && UP=0

  DOWN_F=$(format_speed "$DOWN")
  UP_F=$(format_speed "$UP")
else
  DOWN_F="0 B"
  UP_F="0 B"
fi

echo "$CURR_IN $CURR_OUT" > "$CACHE_FILE"

sketchybar --set network icon=" $UP_F" label=" $DOWN_F"
