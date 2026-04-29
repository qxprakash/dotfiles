#!/bin/bash

LOCK="/tmp/sketchybar-ram.lock"
mkdir "$LOCK" 2>/dev/null || exit 0
trap 'rmdir "$LOCK"' EXIT

PAGESIZE=$(sysctl -n hw.pagesize)
VM=$(vm_stat)

FREE=$(echo "$VM" | awk '/Pages free/ {gsub(/\./,"",$3); print $3}')
ACTIVE=$(echo "$VM" | awk '/Pages active/ {gsub(/\./,"",$3); print $3}')
WIRED=$(echo "$VM" | awk '/Pages wired/ {gsub(/\./,"",$4); print $4}')
COMPRESSED=$(echo "$VM" | awk '/Pages occupied by compressor/ {gsub(/\./,"",$5); print $5}')

TOTAL_BYTES=$(sysctl -n hw.memsize)
TOTAL_PAGES=$((TOTAL_BYTES / PAGESIZE))

USED_PAGES=$((ACTIVE + WIRED + COMPRESSED))

PERCENT=$(awk "BEGIN {printf \"%02.0f\", ($USED_PAGES / $TOTAL_PAGES) * 100}")

sketchybar --set ram label="${PERCENT}%"
