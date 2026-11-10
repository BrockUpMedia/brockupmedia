#!/usr/bin/env bash
# Usage: concat.sh OUT CLIP1 CLIP2 ...   Joins clips that share size and frame rate (output of the other scripts).
set -e; source "$(dirname "$0")/_common.sh"
OUT=$1; shift; L=/tmp/concat_$$.txt; : > $L
for c in "$@"; do echo "file '$(readlink -f "$c")'" >> $L; done
$FF -f concat -safe 0 -i $L -c copy "$OUT"; rm -f $L
