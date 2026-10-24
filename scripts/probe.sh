#!/usr/bin/env bash
# Usage: probe.sh FILE...   -> name, duration (s), WxH, size (MB). One line per file.
source "$(dirname "$0")/_common.sh"
for f in "$@"; do
  d=$($FP -show_entries format=duration -of csv=p=0 "$f"); wh=$($FP -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$f")
  printf "%s  %.1fs  %s  %.1fMB\n" "$(basename "$f")" "$d" "$wh" "$(echo "$(stat -c %s "$f")/1048576" | bc -l)"
done
