# Video editing rules (Liza, 2026-10-24). Follow in every session.

1. Never view video frames, thumbnails or screenshots unless Liza explicitly asks. Work from
   filenames, timestamps, ffprobe data, existing shot logs and transcripts only. For people
   checks (Emma, consent, logos), use the shot logs and `lights-on-content-loop/FOOTAGE.md`;
   if a log doesn't settle it, ask Liza.
2. Run ffmpeg with `-hide_banner -loglevel error -nostats`. Run ffprobe with `-v error` and
   request only the fields needed.
3. Never print full logs, long file listings or whole file contents. Pipe long output through
   `tail -n 20` or `grep`.
4. Never read video, audio or long transcript files into context. Extract only the section
   needed.
5. Repeatable edits use the scripts in `/scripts` (below). If an edit isn't covered, write a new
   script there with clear arguments and a usage line, then use it.
6. Before a render, give Liza the plan in 3 lines max. After a render, report only: output
   filename, duration, resolution, file size (`scripts/probe.sh`).
7. Keep replies short. No explanations unless asked.
8. When moving to a new video, remind Liza to type /clear.

Content rules still apply to every edit: `.claude/skills/pulse-social-playbook/REEL-EDIT.md`
(no spoken audio, never give away the teaching, Inclusive by design end card, never reuse
footage) and `lights-on-content-loop/FOOTAGE.md` (Emma never used, used-shots log, Carioca
credit on Cohort 1 only).

## Scripts (`/scripts`, all silent output, H.264, 30fps, brand font Poppins)

| Script | Usage |
|---|---|
| `probe.sh FILE...` | name, duration, resolution, size |
| `trim.sh IN OUT START DUR [SPEED]` | cut a clip, deinterlaces if needed, SPEED 0.5 = slow motion |
| `reframe.sh IN OUT PRESET [crop\|pad] [X] [ZOOM] [Y]` | resize to reel / feed / square / wide; crop around subject X (ZOOM punches in, Y sets height) or pad on blurred background |
| `still.sh IMAGE OUT PRESET SECONDS` | photo with slow push-in |
| `caption.sh IN OUT CAPTIONS.tsv` | burn captions; TSV lines `start end title\|line text` (`\n` for a second line), inside the safe zone |
| `logo.sh IN OUT LOGO.png [tl\|tr\|bl\|br] [WIDTH]` | logo overlay |
| `endcard.sh OUT PRESET [SEC] [CTA] [HANDLE] [CREDIT]` | Lights On end card (LIGHTS ON, Inclusive by design, CTA, handle, credit) |
| `concat.sh OUT CLIP...` | join clips of the same size |
| `drivecut.sh DRIVE_ID OUT START DUR` | cut a frame-accurate segment from a link-shared Drive video without downloading it (2s handles, so trim from 2) |
| `export.sh IN OUT PLATFORM` | final export to the spec below, prints the report line |

Typical Reel: `trim.sh` each shot, `reframe.sh` to reel, `concat.sh` with `endcard.sh`,
`caption.sh`, `export.sh ... ig-reel`.

## Standard export specs

Draft defaults, Liza to confirm:

| Platform | `export.sh` name | Size | Max length |
|---|---|---|---|
| Instagram Reel | `ig-reel` | 1080x1920 (9:16) | 90s |
| Facebook Reel | `fb-reel` | 1080x1920 (9:16) | 90s |
| Instagram feed video | `ig-feed` | 1080x1350 (4:5) | 60s |
| Facebook feed video | `fb-feed` | 1080x1350 (4:5) | 60s |
| LinkedIn feed video | `linkedin` | 1080x1350 (4:5) | 60s |
| LinkedIn landscape | `linkedin-wide` | 1920x1080 (16:9) | 10 min |
| Website | `website` | 1920x1080 (16:9), silent | none |

All exports: H.264 High, yuv420p, 30fps, CRF 18 (max 12 Mbps), silent AAC track, faststart.
Music for Reels is added by Liza in the Instagram app, never in the export.
