#!/usr/bin/env bash
# Usage: endcard.sh OUT PRESET [SECONDS] [CTA] [HANDLE] [CREDIT]
#   Lights On end card: LIGHTS ON / Inclusive by design / CTA / handle / optional credit (e.g. "Photography: Carioca").
set -e; source "$(dirname "$0")/_common.sh"
OUT=$1 P=$2 SEC=${3:-3} CTA=${4:-Join the Cohort 4 waitlist} HDL=${5:-Link in bio  @lightsonqld} CR=$6
read W H < <(size_for "$P"); K=$([ $H -gt $W ] && echo 100 || echo 80); Y0=$([ $H -gt $W ] && echo 600 || echo 260)
t(){ printf '%s' "$1" > "/tmp/ec_$$_$2.txt"; echo "/tmp/ec_$$_$2.txt"; }
D="drawtext=fontfile=$FONT_BLACK:textfile=$(t "LIGHTS ON" a):fontsize=$((150*K/100)):fontcolor=0xFFD600:x=(w-text_w)/2:y=$Y0"
D="$D,drawtext=fontfile=$FONT_BOLD:textfile=$(t "Inclusive by design" b):fontsize=$((64*K/100)):fontcolor=white:x=(w-text_w)/2:y=$((Y0+200*K/100))"
D="$D,drawtext=fontfile=$FONT_BOLD:textfile=$(t "$CTA" c):fontsize=$((60*K/100)):fontcolor=0xFFD600:x=(w-text_w)/2:y=$((Y0+370*K/100))"
D="$D,drawtext=fontfile=$FONT_SEMI:textfile=$(t "$HDL" d):fontsize=$((52*K/100)):fontcolor=white:x=(w-text_w)/2:y=$((Y0+460*K/100))"
[ -n "$CR" ] && D="$D,drawtext=fontfile=$FONT_SEMI:textfile=$(t "$CR" e):fontsize=$((40*K/100)):fontcolor=0xBBBBBB:x=(w-text_w)/2:y=$((Y0+600*K/100))"
$FF -f lavfi -i "color=c=0x0D0D0D:s=${W}x${H}:r=30:d=$SEC" -vf "$D,fade=in:st=0:d=0.25,format=yuv420p" $ENC "$OUT"; rm -f /tmp/ec_$$_*.txt
