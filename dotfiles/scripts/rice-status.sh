#!/bin/bash
# Check status of AeroSpace + SketchyBar + JankyBorders + media widget

check() {
  if pgrep -x "$1" >/dev/null 2>&1; then
    echo "  $1: running"
  else
    echo "  $1: stopped"
  fi
}

check_script() {
  local label="$1"
  local pattern="$2"
  if pgrep -f "$pattern" >/dev/null 2>&1; then
    echo "  $label: running"
  else
    echo "  $label: stopped"
  fi
}

echo "Rice status:"
check AeroSpace
check sketchybar
check borders
check_script media_stream "media_stream.sh"
