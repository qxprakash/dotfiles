#!/bin/bash

LOCK="/tmp/sketchybar-cpu.lock"
mkdir "$LOCK" 2>/dev/null || exit 0
trap 'rmdir "$LOCK"' EXIT

CPU=$(top -l 1 -n 0 | awk '/CPU usage/ {gsub(/%/,"",$3); gsub(/%/,"",$5); printf "%02.0f", $3 + $5}')

sketchybar --set cpu label="${CPU}%"
