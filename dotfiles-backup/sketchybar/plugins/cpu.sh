#!/bin/bash

CPU=$(top -l 1 -n 0 | awk '/CPU usage/ {gsub(/%/,"",$3); gsub(/%/,"",$5); printf "%02.0f", $3 + $5}')

sketchybar --set cpu label="${CPU}%"
