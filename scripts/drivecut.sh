#!/usr/bin/env bash
# Usage: drivecut.sh DRIVE_ID OUT START DUR
#   Cuts a segment from a link-shared Drive video without downloading the whole file.
#   Frame accurate, deinterlaced, near-lossless, 2s handles each side. Feed OUT (.mp4) to trim.sh with START 2.
set -e
ID=$1 OUT=$2 ST=$3 D=$4
U="https://drive.usercontent.google.com/download?id=$ID&export=download&confirm=t"
S=$(awk -v s=$ST 'BEGIN{s-=2; if(s<0)s=0; print s}')
ffmpeg -hide_banner -loglevel error -nostats -y -http_proxy "$HTTPS_PROXY" -ca_file /root/.ccr/ca-bundle.crt \
  -ss "$S" -i "$U" -t "$(awk -v d=$D 'BEGIN{print d+4}')" -map 0:v:0 -vf "yadif=0:-1:1" \
  -c:v libx264 -preset veryfast -crf 12 -pix_fmt yuv420p -an "$OUT" </dev/null
