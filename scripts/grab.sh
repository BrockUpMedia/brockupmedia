#!/usr/bin/env bash
# Usage: grab.sh DRIVE_ID OUTPREFIX N [CROP]
#   Pulls N evenly spaced stills from a link-shared Drive video without downloading it.
#   Skips the first and last 8% of the clip. Deinterlaces. CROP=feed (default) centre-crops to
#   1080x1350 (4:5); CROP=none keeps the full frame. Writes OUTPREFIX_01.jpg, _02.jpg ...
set -e
ID=$1 PRE=$2 N=$3 CROP=${4:-feed}
[ -z "$N" ] && { sed -n 2,5p "$0"; exit 1; }
U="https://drive.usercontent.google.com/download?id=$ID&export=download&confirm=t"
NET=(-http_proxy "$HTTPS_PROXY" -ca_file /root/.ccr/ca-bundle.crt)
D=$(ffprobe -v error "${NET[@]}" -show_entries format=duration -of csv=p=0 "$U")
VF="yadif=0:-1:0"
[ "$CROP" = feed ] && VF="$VF,crop=min(iw\,ih*4/5):min(ih\,iw*5/4),scale=1080:1350"
for i in $(seq 1 "$N"); do
  T=$(awk -v d="$D" -v i="$i" -v n="$N" 'BEGIN{printf "%.2f", d*0.08 + (d*0.84)*(i-0.5)/n}')
  ffmpeg -hide_banner -loglevel error -nostats -y "${NET[@]}" -ss "$T" -i "$U" \
    -frames:v 1 -vf "$VF" -q:v 2 "$(printf '%s_%02d.jpg' "$PRE" "$i")" </dev/null
done
echo "$N stills from $ID (${D}s)"
