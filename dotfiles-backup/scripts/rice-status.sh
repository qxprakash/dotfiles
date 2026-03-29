#!/bin/bash
# Check status of AeroSpace + SketchyBar + JankyBorders

check() {
  if pgrep -x "$1" >/dev/null 2>&1; then
    echo "  $1: running"
  else
    echo "  $1: stopped"
  fi
}

echo "Rice status:"
check AeroSpace
check sketchybar
check borders
