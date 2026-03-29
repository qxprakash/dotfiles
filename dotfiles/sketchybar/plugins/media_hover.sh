#!/bin/bash
case "$SENDER" in
  mouse.entered)
    sketchybar --set media scroll_texts=on
    ;;
  mouse.exited)
    sketchybar --set media scroll_texts=off
    ;;
esac
