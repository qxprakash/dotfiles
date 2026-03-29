#!/bin/bash
# Stop AeroSpace + SketchyBar + JankyBorders

echo "Stopping rice setup..."
pkill -f media_stream.sh 2>/dev/null
pkill -f "media-control stream" 2>/dev/null
brew services stop sketchybar 2>/dev/null
killall sketchybar 2>/dev/null
killall borders 2>/dev/null
killall AeroSpace 2>/dev/null
sleep 1
# Force kill if still running
killall -9 sketchybar 2>/dev/null
killall -9 borders 2>/dev/null
echo "Done."
