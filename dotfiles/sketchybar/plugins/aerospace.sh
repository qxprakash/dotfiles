#!/bin/bash

PLUGIN_DIR="$(dirname "$0")"
WORKSPACE_ID="${NAME#space.}"

# Default icons per workspace (bash 3.2 compatible)
get_default_icon() {
  case "$1" in
    1) echo ":ghostty:" ;;
    2) echo ":spotify:" ;;
    3) echo ":firefox:" ;;
    4) echo ":code:" ;;
    5) echo ":iterm:" ;;
    6) echo ":slack:" ;;
    7) echo ":telegram:" ;;
    8) echo ":finder:" ;;
    9) echo ":claude:" ;;
    *) echo "•" ;;
  esac
}

# Get app icons for a workspace, or fall back to default icon
get_workspace_icons() {
  local ws="$1"
  local apps
  apps=$(aerospace list-windows --workspace "$ws" --format '%{app-name}' 2>/dev/null)

  if [ -z "$apps" ]; then
    get_default_icon "$ws"
    return
  fi

  local icon_strip=""
  local seen=""
  while IFS= read -r app; do
    if echo "$seen" | grep -qF "|${app}|"; then
      continue
    fi
    seen="${seen}|${app}|"

    local icon
    icon=$("$PLUGIN_DIR/icon_map_fn.sh" "$app")
    if [ "$icon" = ":default:" ]; then
      icon="•"
    fi
    icon_strip="${icon_strip}${icon} "
  done <<< "$apps"

  echo "${icon_strip% }"
}

update() {
  local focused="${FOCUSED_WORKSPACE}"
  if [ -z "$focused" ]; then
    focused=$(aerospace list-workspaces --focused 2>/dev/null)
  fi

  local icons
  icons=$(get_workspace_icons "$WORKSPACE_ID")

  if [ "$WORKSPACE_ID" = "$focused" ]; then
    sketchybar --set "$NAME" \
      label="$icons" \
      label.font="sketchybar-app-font:Regular:14.0" \
      label.highlight=on \
      icon.highlight=on \
      background.drawing=on
  else
    sketchybar --set "$NAME" \
      label="$icons" \
      label.font="sketchybar-app-font:Regular:14.0" \
      label.highlight=off \
      icon.highlight=off \
      background.drawing=off
  fi
}

mouse_entered() {
  sketchybar --set "$NAME" icon.highlight=on
}

mouse_exited() {
  local focused="${FOCUSED_WORKSPACE}"
  if [ -z "$focused" ]; then
    focused=$(aerospace list-workspaces --focused 2>/dev/null)
  fi
  if [ "$WORKSPACE_ID" != "$focused" ]; then
    sketchybar --set "$NAME" icon.highlight=off
  fi
}

case "$SENDER" in
  "mouse.entered") mouse_entered ;;
  "mouse.exited") mouse_exited ;;
  *) update ;;
esac
