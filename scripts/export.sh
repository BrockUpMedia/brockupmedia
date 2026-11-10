#!/usr/bin/env bash
# Usage: export.sh IN OUT PLATFORM   Final encode to the standard spec (see CLAUDE.md), then prints the report line.
#   PLATFORM ig-reel | fb-reel | ig-feed | fb-feed | linkedin | linkedin-wide | website
set -e; source "$(dirname "$0")/_common.sh"
IN=$1 OUT=$2 PL=$3
case $PL in ig-reel|fb-reel) P=reel; MAX=90;; ig-feed|fb-feed|linkedin) P=feed; MAX=60;; linkedin-wide|website) P=wide; MAX=600;; *) echo "unknown platform" >&2; exit 1;; esac
read W H < <(size_for $P)
D=$($FP -show_entries format=duration -of csv=p=0 "$IN"); awk "BEGIN{exit !($D>$MAX)}" && echo "warning: ${D}s is over the ${MAX}s limit for $PL" >&2
$FF -i "$IN" -f lavfi -i anullsrc=r=48000:cl=stereo -shortest -map 0:v -map 1:a -vf "scale=$W:$H:force_original_aspect_ratio=decrease,pad=$W:$H:(ow-iw)/2:(oh-ih)/2:color=0x0D0D0D,setsar=1" $ENC -b:v 0 -maxrate 12M -bufsize 24M -c:a aac -b:a 128k "$OUT"
"$(dirname "$0")/probe.sh" "$OUT"
