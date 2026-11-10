#!/usr/bin/env bash
# Usage: logo.sh IN OUT LOGO.png [POS] [WIDTH]   POS tl|tr|bl|br (default br), WIDTH px (default 220).
set -e; source "$(dirname "$0")/_common.sh"
IN=$1 OUT=$2 L=$3 POS=${4:-br} LW=${5:-220} M=60
case $POS in tl) XY="$M:$M";; tr) XY="W-w-$M:$M";; bl) XY="$M:H-h-$M";; *) XY="W-w-$M:H-h-$M";; esac
$FF -i "$IN" -i "$L" -an -filter_complex "[1:v]scale=$LW:-1[l];[0:v][l]overlay=$XY" $ENC "$OUT"
