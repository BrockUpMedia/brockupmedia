# Shared settings for the video scripts. Sourced, not run.
FF="ffmpeg -hide_banner -loglevel error -nostats -y"
# MTS seeks print harmless decoder warnings; filter them out
ff() { $FF "$@" 2> >(grep -v -E "reference picture|Last message repeated" >&2); }
FP="ffprobe -v error"
SCRIPTS="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FONT_BOLD="$SCRIPTS/fonts/Poppins-800.ttf"
FONT_BLACK="$SCRIPTS/fonts/Poppins-900.ttf"
FONT_SEMI="$SCRIPTS/fonts/Poppins-600.ttf"
GRADE="eq=contrast=1.06:saturation=1.1:gamma=1.02,unsharp=5:5:0.4"
ENC="-c:v libx264 -preset slow -crf 18 -pix_fmt yuv420p -r 30 -movflags +faststart"
# Preset sizes: reel/story 9:16, feed 4:5, square 1:1, wide 16:9
size_for() { case "$1" in reel) echo 1080 1920;; feed) echo 1080 1350;; square) echo 1080 1080;; wide) echo 1920 1080;; *) echo "unknown preset $1" >&2; exit 1;; esac; }
# Deinterlace only when the source is interlaced
deint_for() { local fo; fo=$($FP -select_streams v:0 -show_entries stream=field_order -of csv=p=0 "$1"); case "$fo" in tt|bb|tb|bt) echo "yadif,";; *) echo "";; esac; }
