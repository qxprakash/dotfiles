#!/bin/bash
# Restart (or start) AeroSpace + SketchyBar + JankyBorders

echo "Restarting rice setup..."

# Stop if running
killall borders 2>/dev/null
brew services stop sketchybar 2>/dev/null
killall AeroSpace 2>/dev/null
sleep 1

# Start
open -a AeroSpace
brew services start sketchybar 2>/dev/null
borders active_color=0xff00ff00 inactive_color=0xff555555 width=8.0 &
disown

echo "Done."
