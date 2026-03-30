#!/bin/bash
# Restart (or start) AeroSpace + SketchyBar + JankyBorders + Media Widget

echo "Restarting rice setup..."

# Stop if running
pkill -f media_stream.sh 2>/dev/null
pkill -f "media-control stream" 2>/dev/null
killall sketchybar 2>/dev/null
killall borders 2>/dev/null
killall AeroSpace 2>/dev/null
sleep 1
killall -9 sketchybar 2>/dev/null
killall -9 borders 2>/dev/null

# Start
open -a AeroSpace
sleep 1
sketchybar &
disown
borders active_color=0xff00ff00 inactive_color=0xff555555 width=8.0 &
disown
~/.config/sketchybar/plugins/media_stream.sh &
disown

echo "Done."
