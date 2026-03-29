#!/bin/bash

sketchybar -m --set disk_percentage label=$(df -H / | tail -1 | awk '{ print $5 }')
