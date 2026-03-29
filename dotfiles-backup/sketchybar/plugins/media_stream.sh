#!/bin/bash
# Media widget for sketchybar.
# Single polling loop — checks media-control and cliamp every 0.15s.
# Simple, reliable, no background subprocesses.

# Prevent duplicate instances
PIDFILE="/tmp/media_stream.pid"
if [ -f "$PIDFILE" ]; then
  oldpid=$(cat "$PIDFILE" 2>/dev/null)
  if kill -0 "$oldpid" 2>/dev/null; then
    exit 0
  fi
fi
echo $$ > "$PIDFILE"
trap 'rm -f "$PIDFILE"' EXIT

ICON_PAUSE="󰏤"
CLIAMP_FILE="/tmp/cliamp-nowplaying.json"
BARS=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

random_bars() {
  local out=""
  for i in 1 2 3 4 5 6 7; do
    if (( RANDOM % 10 < 7 )); then
      out="${out}${BARS[$((3 + RANDOM % 5))]}"
    else
      out="${out}${BARS[$((RANDOM % 3))]}"
    fi
  done
  echo "$out"
}

last_title=""
last_artist=""
last_playing=""
frame=0

while true; do
  title=""
  artist=""
  playing="false"

  # 1. Check system media (media-control) — every 2 seconds to avoid overhead
  if (( frame % 13 == 0 )); then
    mc_out=$(media-control get 2>/dev/null)
    if [ -n "$mc_out" ] && [ "$mc_out" != "null" ]; then
      mc_title=$(echo "$mc_out" | sed 's/"artworkData":"[^"]*",//g' | jq -r '.title // empty' 2>/dev/null)
      mc_artist=$(echo "$mc_out" | sed 's/"artworkData":"[^"]*",//g' | jq -r '.artist // empty' 2>/dev/null)
      mc_playing=$(echo "$mc_out" | sed 's/"artworkData":"[^"]*",//g' | jq -r 'if .playing == true then "true" else "false" end' 2>/dev/null)
      if [ -n "$mc_title" ]; then
        title="$mc_title"
        artist="$mc_artist"
        playing="$mc_playing"
      fi
    fi
  else
    # Reuse last known system media state between polls
    title="$last_title"
    artist="$last_artist"
    playing="$last_playing"
  fi

  # 2. Check cliamp file (overrides system media if cliamp is running)
  if [ -f "$CLIAMP_FILE" ] && pgrep -x cliamp >/dev/null 2>&1; then
    c_title=$(jq -r '.title // empty' "$CLIAMP_FILE" 2>/dev/null)
    c_status=$(jq -r '.status // empty' "$CLIAMP_FILE" 2>/dev/null)
    c_artist=$(jq -r '.artist // empty' "$CLIAMP_FILE" 2>/dev/null)
    if [ -n "$c_title" ]; then
      title="$c_title"
      artist="$c_artist"
      playing="false"
      [ "$c_status" = "Playing" ] && playing="true"
    fi
  elif [ -f "$CLIAMP_FILE" ] && ! pgrep -x cliamp >/dev/null 2>&1; then
    rm -f "$CLIAMP_FILE"
  fi

  # 3. Update sketchybar
  if [ -z "$title" ]; then
    sketchybar --set media drawing=off 2>/dev/null
  else
    display_title="$title"
    display_artist="$artist"
    [ ${#display_title} -gt 25 ] && display_title="${display_title:0:22}..."
    [ ${#display_artist} -gt 20 ] && display_artist="${display_artist:0:17}..."

    label="$display_title"
    [ -n "$display_artist" ] && label="${display_artist} • ${display_title}"

    if [ "$playing" = "true" ]; then
      bars=$(random_bars)
      sketchybar --set media drawing=on icon="♫ $bars" label="$label" 2>/dev/null
    else
      sketchybar --set media drawing=on icon="$ICON_PAUSE" label="$label" 2>/dev/null
    fi
  fi

  last_title="$title"
  last_artist="$artist"
  last_playing="$playing"
  frame=$((frame + 1))

  sleep 0.15
done
