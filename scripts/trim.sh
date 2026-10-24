#!/usr/bin/env bash
# Usage: trim.sh IN OUT START DURATION [SPEED]   Silent, re-encoded, deinterlaced if needed. SPEED 0.5 = slow motion.
set -e; source "$(dirname "$0")/_common.sh"
IN=$1 OUT=$2 SS=$3 D=$4 SP=${5:-1}
SRC=$(echo "$D*$SP" | bc -l)
$FF -ss "$SS" -t "$SRC" -i "$IN" -an -vf "$(deint_for "$IN")setpts=PTS/$SP,fps=30,setsar=1" -t "$D" $ENC "$OUT"
