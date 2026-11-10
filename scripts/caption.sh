#!/usr/bin/env bash
# Usage: caption.sh IN OUT CAPTIONS.tsv
#   CAPTIONS.tsv lines: START<TAB>END<TAB>STYLE<TAB>TEXT   STYLE = title (big yellow) | line (white on dark band)
#   Use \n in TEXT for a second line. Captions sit inside the Instagram safe zone.
set -e; source "$(dirname "$0")/_common.sh"
IN=$1 OUT=$2 CAP=$3
IFS=x read W H < <($FP -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$IN")
V=$([ $H -gt $W ] && echo 1 || echo 0)
F=""; i=0
while IFS=$'\t' read -r A B S T; do
  [ -z "$A" ] && continue; i=$((i+1)); TF="/tmp/cap_$$_$i.txt"; printf '%b' "$T" > "$TF"
  if [ "$S" = title ]; then FS=$([ $V = 1 ] && echo 74 || echo 64); FC=0xFFD600; FN=$FONT_BLACK; Y=$([ $V = 1 ] && echo 1150 || echo 120)
  else FS=$([ $V = 1 ] && echo 58 || echo 46); FC=white; FN=$FONT_BOLD; Y=$([ $V = 1 ] && echo 1290 || echo "h-th-90"); fi
  F="$F${F:+,}drawtext=fontfile=$FN:textfile=$TF:fontsize=$FS:fontcolor=$FC:line_spacing=12:text_align=C:box=1:boxcolor=0x0D0D0DD9:boxborderw=18:x=(w-text_w)/2:y=$Y:enable='between(t,$A,$B)'"
done < "$CAP"
$FF -i "$IN" -an -vf "$F" $ENC "$OUT"; rm -f /tmp/cap_$$_*.txt
