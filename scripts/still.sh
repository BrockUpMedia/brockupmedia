#!/usr/bin/env bash
# Usage: still.sh IMAGE OUT PRESET SECONDS   Slow Ken Burns push-in on a photo, cropped to the preset.
set -e; source "$(dirname "$0")/_common.sh"
IN=$1 OUT=$2 P=$3 SEC=$4; read W H < <(size_for "$P"); N=$(echo "$SEC*30/1" | bc)
$FF -loop 1 -i "$IN" -vf "scale=$((W*2)):$((H*2)):force_original_aspect_ratio=increase,crop=$((W*2)):$((H*2)),zoompan=z='1+0.05*on/$N':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=$N:s=${W}x${H}:fps=30,$GRADE,format=yuv420p" -frames:v $N $ENC "$OUT"
