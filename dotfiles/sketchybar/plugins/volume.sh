#!/bin/bash

LOCK="/tmp/sketchybar-volume.lock"
mkdir "$LOCK" 2>/dev/null || exit 0
trap 'rmdir "$LOCK"' EXIT

LABEL=$(osascript -e 'output volume of (get volume settings)')%

sketchybar -m --set "$NAME" label="$LABEL"
