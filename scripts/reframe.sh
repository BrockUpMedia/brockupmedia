#!/usr/bin/env bash
# Usage: reframe.sh IN OUT PRESET [MODE] [X] [ZOOM] [Y]
#   PRESET reel|feed|square|wide.  MODE crop (default) | pad (blurred background, keeps whole frame).
#   X = horizontal centre of the subject in source pixels for crop mode (default: frame centre).
#   ZOOM = punch in, e.g. 1.6 for a tight face crop that keeps chest logos out (default 1).
#   Y = vertical centre of the crop in source pixels when zoomed (default: frame centre).
set -e; source "$(dirname "$0")/_common.sh"
IN=$1 OUT=$2 P=$3 MODE=${4:-crop} X=$5 ZOOM=${6:-1} Y=$7
read W H < <(size_for "$P")
IFS=x read SW SH < <($FP -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$IN")
DI=$(deint_for "$IN")
if [ "$MODE" = pad ]; then
  VF="${DI}split[a][b];[a]scale=$W:$H:force_original_aspect_ratio=increase,crop=$W:$H,boxblur=30:5,eq=brightness=-0.15[bg];[b]scale=$W:$H:force_original_aspect_ratio=decrease[fg];[bg][fg]overlay=(W-w)/2:(H-h)/2"
else
  CW=$(( SH*W/H )); [ $CW -gt $SW ] && CW=$SW
  CW=$(awk -v c=$CW -v z=$ZOOM 'BEGIN{printf "%d", c/z/2*2}'); CH=$(( CW*H/W/2*2 ))
  X=${X:-$((SW/2))}; CX=$(( X-CW/2 )); [ $CX -lt 0 ] && CX=0; [ $((CX+CW)) -gt $SW ] && CX=$((SW-CW))
  Y=${Y:-$((SH/2))}; CY=$(( Y-CH/2 )); [ $CY -lt 0 ] && CY=0; [ $((CY+CH)) -gt $SH ] && CY=$((SH-CH))
  VF="${DI}crop=$CW:$CH:$CX:$CY,scale=$W:$H:flags=lanczos"
fi
ff -i "$IN" -an -filter_complex "[0:v]$VF,fps=30,setsar=1,$GRADE[o]" -map "[o]" $ENC "$OUT"
