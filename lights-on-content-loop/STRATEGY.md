# Lights On content loop: strategy brief

This is the single source of truth the four agents (`lights-on-strategist`, `lights-on-writer`,
`lights-on-scheduler`, `lights-on-daily-digest`) read before doing anything. Keep it current. If a fact here goes stale,
fix it here, not in one agent file, so all three stay in sync.

## Goal

This is brand-partnership content, not general audience content. Every post exists to move a
brand, sponsor, or funder toward the Lights On partnerships pathway. No filler posts. If a day's
angle can't carry a genuine reason for a partner to click through, skip posting that day rather
than posting anyway.

## Call to action

**Primary CTA URL**: `https://partnerships.brockupmedia.com.au/` — the Lights On brand
partnerships page. Confirmed live by Liza on 2026-08-15. This is the CTA for every post: LinkedIn
and Facebook link to it directly, Instagram uses "link in bio" pointing to the same URL.

Note: the `lights-on-partnerships` skill still describes this subdomain as "paused, not live."
That's now out of date, flag it for a skill update the next time someone's in that skill.

**Fallback CTA** (use if a post reads better as a direct-contact ask than a browse-the-site ask):
`brands@brockupmedia.com.au`

Do not use `brockcasting.com.au/lights-on-brisbane` as the partnership CTA, that's the
participant signup page for the training program, not the partner-facing page.

## Blotato setup (switched from Buffer on 2026-10-10)

Buffer is retired. Do not call any Buffer tool. Publishing now runs through Blotato.

- Blotato plan: Starter, active (verified 2026-10-10).
- Connected accounts (verified 2026-10-10 via `blotato_list_accounts`):
  - LinkedIn: accountId `38690` (Liza Brock). Lights On company page "Lights On Studio" is
    pageId `133063933`. Always pass it, or the post goes to Liza's personal profile.
  - Facebook: accountId `57070` (Liza Brock). "Lights On QLD" page is pageId
    `1159899887215852` (required).
  - Instagram: accountId `77116` ("lightsonqld"). Image feed posts need no mediaType; videos use
    `mediaType: "reel"` with `shareToFeed: true`.
  - Not Lights On, never post Lights On content to these: Facebook page "Brock Casting Services
    Brisbane" (`236990256158164`), LinkedIn page "BROCK CASTING SERVICES" (`100888878`), YouTube
    account `52989`.
- Existing queue: as of 2026-10-10 Liza already has a Brisbane Disability Expo campaign
  scheduled in Blotato (Facebook + Instagram every 2-3 days, 13 to 24 October, 6pm Brisbane).
  The strategist must check `blotato_list_schedules` and not stack new posts on days that
  already have one per channel.
- Channels in scope: LinkedIn, Facebook, Instagram only. No TikTok. Do not add other platforms.
- **Post every day on every channel (Liza, 2026-10-13).** LinkedIn, Facebook and Instagram each
  get one post a day. Each weekly run, check `blotato_list_schedules` and draft only for days in
  Tuesday through next Monday that have no post on that channel yet. Never stack two posts on one
  channel on one day.
- **This loop is the only place posts get made from now on** (Liza, 2026-10-13). Posts already
  in the Blotato queue from earlier chats stay as they are; the loop fills the gaps around them.
- Default posting times (Australia/Brisbane, UTC+10, no daylight saving), the next free day after
  approval: LinkedIn 7:45am, Facebook 6pm, Instagram 6pm (matching the times Liza already uses). Change them here, not in an agent file.

### Approval gate (non-negotiable)

**Blotato has no draft mode for LinkedIn, Facebook or Instagram. Anything sent to
`blotato_create_post` is either published immediately or scheduled to go live.** So the gate now
lives in the conversation, not in the scheduling tool:

1. The weekly loop drafts captions and picks images, then outputs an **APPROVAL PACK** in chat,
   with a proof sheet of the actual images. Liza signs off on the images as well as the words.
   It does NOT call `blotato_create_post`. Ever. Not attended, not unattended.
2. Only when Liza explicitly approves in chat ("go", "approved", "post them", or approves
   specific channels) does `lights-on-scheduler` schedule the approved posts in Blotato.
3. Always schedule with `scheduledTime`. Never omit it (omitting it publishes instantly).
4. Approval covers only the exact text Liza saw. If anything changes after approval, re-show it.
5. Liza can pull a scheduled post before it fires: `blotato_list_schedules` then
   `blotato_delete_schedule`.

### Images

Drive files stay private. After approval, the scheduler downloads the chosen Drive image,
uploads it to Blotato with `blotato_create_presigned_upload_url` (raw bytes via HTTP PUT), and
attaches the returned `publicUrl` in `mediaUrls`. That makes the image reachable only via
Blotato's own URL, at the moment it is being published publicly anyway. Do not change Drive
sharing settings. Instagram cannot post text-only, so an Instagram draft without an image is not
approvable: flag it.

## Content library (Google Drive)

Master folder: "LIGHTS ON MASTER FOLDER" — `1xD6SUdRajhG998qSAdm1h5NwFgCkCRIH`

**Primary folder, check here first**: "CLAUDE SOCIAL MEDIA COHORT !" —
`1vZtL_KFrADBhGaMK-a5Demwz5rP5ej4W`. Liza set this up specifically for this loop and will keep
adding to it, so treat it as the live, current source, not the scattered subfolders below.
Search it fresh each run, don't rely only on the list below, she's adding to it over time. The
writer agent's tools can't open images, so these written descriptions (checked visually on
2026-08-16) are how it knows what's actually in a photo rather than guessing from the filename:

- `20260317_182602.jpg` — **best general-purpose option.** Casual group photo, several cohort
  members together including a wheelchair user, genuine warm energy, indoor setting with a city
  view behind them. Matches the brand's "authentic moment" photography rule well. Good default
  for proof-point or cohort-together posts.
- `20260407_194549.jpg` — clean posed portrait of three people (looks like a mentor/staff plus
  participants) against a plain light background, smiling at camera. Versatile, professional
  looking, works for program-mechanics or partnership-credibility posts. Note: plain light
  background, not the brand's usual dark studio tone, don't pair with heavy yellow/black text
  overlay, it won't read well against it.
- `On-sET.jpg` — behind-the-scenes shot of an actual shoot in progress: studio lighting rig, a
  participant seated for a photo/video session, crew around a monitor. White backdrop, not dark.
  Use this specifically for a "behind the scenes / real training" pillar post, not as a generic
  proof-point image.
- `20260331_182436.jpg` — **skip this one.** Badly framed candid, blocked by someone's leg in the
  foreground, only a partial view of one person. Not usable as a post image as-is.

**Liza's headshot (Liza, 2026-10-15): always use `assets/liza-brock-headshot-glasses.jpg`** in
this repo (black blazer, tortoiseshell glasses, grey backdrop) whenever a post on any page shows
Liza. She wears glasses, so never use her older headshots without them. Crop to 4:5 from the top
for feeds.

Do not guess who is pictured in any of these. No name is confirmed from the photo alone, if a
post needs to name someone, that name must come from STRATEGY.md's locked facts, not an assumption
about who's in a photo.

**Cohort 2 headshots, Instagram-ready (added 2026-10-13):** "CH_2_instagram_size (Unzipped
Files)" `1M-T_yPtIZdCwvMumKqR5h5P-6NTgx42s`. Sixteen PNGs, already 1080x1350 (4:5) and upright, so
they need no rotating, cropping or borders. Professional studio portraits on a grey backdrop, with
no Lights On text bar. As of 13 Oct these shots had not yet been used in any scheduled post:
`1.png` (graduate in red glasses, standing, full length), `2.png` (two graduates reading scripts,
light background; good for program or behind-the-scenes posts), `4.png` (graduate in a bright
jersey, playful hand frame), `5.png` (graduate in green, arms folded), `7.png` (character shot,
chocolate on face, orange backdrop; strong scroll stopper) and `10.png` (graduate seated, brown
cardigan). The others repeat headshots already in the queue. Do not name anyone pictured unless
Liza supplies the name.

The headshots already scheduled (2:3 with a "LIGHTS ON" bar) are too tall for Instagram. Before
posting any 2:3 image to Instagram, pad it to 4:5 with near-black `#0D0D0D` side borders. Never
crop it, because cropping cuts off the brand bar.

**Cohort 3 BTS and media consent (Liza, 2026-10-21).** Every cohort signs a media release before
starting. Weekly BTS lands in "CH3_WK-LESSON_1_8" `1BojLl5Y51vE0hgfn8yEE0uCBpBfU_gNX`, one folder
per week (e.g. CH3_WK8_BTS `1G7DU2d6NjAoSyg4DUtvtHKpAVRo5iT5C`, vertical 1080x1920 phone clips
and 3000x4000 photos). Everything sitting loose in a week folder is free to post. Liza moves
anything she doesn't want used into that week's **Do not post** subfolder (Wk 8:
`1hS4xlF-NMXoNqQP-MBI0LkhcH-QrMJSB`); never use anything inside it. Names come only from the sheet
"Cohort 3 media consent" `1v5F6vwC_Oz5yw4dvN-7-1BpKFXiXGH751d1AYfiQ91c` (OK to show, OK to name,
Instagram handle). Name or tag someone only where OK to name is Y. Each new week folder gets a Do
not post subfolder. Ignore the raw .MTS camera folders for social.

**Reel audio (Liza, 2026-10-21): every Reel gets upbeat music from Instagram's own library, never
the original audio.** **Never keep spoken audio, ever (Liza, 2026-10-22), not even on teaching
clips or interviews.** Strip all original sound. When the words matter (a tip, a line of advice),
they go on screen as full sentence captions, never word by word flashes, timed to be read twice.

**Video title line: "Inclusive by design" (Liza, 2026-10-22).** Every Lights On video end card and
title reads "Inclusive by design", never "disability-led". Liza extended this to everything the
same day: all copy, captions and hashtags use "inclusive by design" (#InclusiveByDesign), never
"disability-led" or #DisabilityLed. Full footage list: FOOTAGE.md.

**Never give away the teaching (Liza, 2026-10-22).** No post, caption or on-screen text reveals
what is taught in the program: no tips, techniques, exercises or advice from the sessions, and no
actor or tutor voices. Teaching footage is used only as behind the scenes atmosphere (the room,
focus, laughter, people on their feet, the camera rolling), with captions about the experience and
the people, never the lesson. Educate posts draw on Liza's casting expertise and industry insight,
not the Lights On curriculum.

**Footage credit (Liza, 2026-10-22).** Carolina at Carioca (carioca.au) shot the Cohort 1 pro BTS
and wants to be tagged on every post that uses her footage. Credit Carioca on Cohort 1 footage
only, never on any other cohort (Liza, 2026-10-22). On those posts tag her (Instagram collaborator or tag, and a
"Footage: Carioca" credit line elsewhere). Instagram handle: ASK LIZA, not yet confirmed. Some
Cohort 1 footage is Liza's own phone footage; no credit needed on those. Blotato posts through the API and cannot add Instagram music, so Reels never
go through Blotato. Instead:
1. Cut the Reel here: original sound stripped completely, vertical 1080x1920, best shot first, a
   bold text hook on screen in the first second, short on-screen text lines, and a "[Upbeat
   music]" caption at the start for screen reader and Deaf viewers.
2. Upload the silent cut to "REELS READY TO POST" `1RiH4DvGOPME1MrUNCN51Zb_iORmnmSEC` in the
   Lights On master folder, with the approved caption, hashtags, collaborators and a suggested
   music mood in the pack.
3. Liza posts it from the Instagram app on @lightsonqld: adds a track from Instagram's music
   library, ticks "Share to Facebook" so the Lights On QLD page gets it with the same music, and
   posts or schedules it there. Flag it in the push notification so it doesn't get missed.
4. LinkedIn never gets the Reel (no Instagram music there); use photos for the Studio page.
Instagram business accounts only get the commercial-use music library, so suggest a mood, not a
specific chart song. Mood (Liza, 2026-10-21): positive, uplifting and motivating, music that says
"keep going, never give up": building piano or strings into a driving beat, warm pop, anthemic.
Not sad, not sentimental, not cheesy. The music carries the feeling; the captions still follow
the voice rules (never "brave", "inspiring" or "overcome" about participants). Show progress and
confidence, let the music lift it.

**Hero photo (Liza, 2026-10-22, "I love this picture, use this in our social posts"):**
`assets/lights-on-commercial-set-bts.jpg` (9:16 phone photo). Two participants at a high table with
a product box during a commercial scene, Liza (confirmed by Liza) in glasses holding the script up
beside the lens,
and a man operating a 4K camera on a tripod, softbox behind. Feed crop: 4:5 at x 110, y 470,
width 920 (1080x1350), keeps all four people and trims the floor. Use it as the go-to image for
"a real commercial set" posts on all three channels. Captions name her as "Liza Brock, Casting
Director at Brock Casting Services" (tag @brockcasting on Instagram). Don't name the others
unless Liza supplies the names.

**Cohort 2 footage "CH2_WARREN_DEMPSTER"** `1wFyWCz0t5N3UN80CDdjMlroSAtsHEsRN` (Liza, 2026-10-22,
"great for Instagram"): .MTS camera clips (COHORT2_nn.MTS, 000nn.MTS) and Warren_Milo.mp4. Same
rules: no original audio, no teaching content. It also holds "LIGHTS_ON_8 week course pdf.pdf",
the curriculum: never use it or quote it in any post.
**"Cohort 2 _WK 6 No sound"** `1hR_UTPmWZcQKZVpvlwk39TbcEz2Tqkng` (Liza, 2026-10-22, "great
footage"): small .MTS clips (20 to 50MB) from 2 July, Week 6, already silent. Ready for a Reel.

Older subfolders (check only if the primary folder doesn't have something that fits):
- "Lights On - Cohort 2 Social Assets" — `1elqVjuA6bLcq931im3TLXqcSGyMnpGUI` (most recent, prefer
  for current cohort content)
- "Lights On BRAND" — `1Vvc8vU31wNIfANI7se5lP6R2gZav9LeC` (logos, brand assets)
- "LIGHTS ON MARKETING" — `1FfMi2YscHjDrOTn6sk1iTh9zUuoStVFx`
- "00_1_Cohort 1 Social Media" — `17NDnWbtPX8JvREjQxHqOpiDN5ec0FmgN`. Liza cleared it for use
  (2026-10-22). Holds 8 finished vertical teaching shorts from Cohort 1 (720x1280, made in
  Vizard with word-by-word captions and spoken audio): "The Secret to Great Camera Acting:
  Stillness", "When to Disclose on a Film Set", "Understanding the Hierarchy on a Film Set",
  "POV Acting Mistakes: Staring at Blank Walls", "One Shot Table Jump Challenge", "Don't mess
  with a parent protecting their child", "A Hilarious Horse Riding Audition Fail" (v2 is an
  identical duplicate). Use only as behind the scenes atmosphere, never for the advice itself (see "Never give away the
  teaching"). Before using, trim the "vizard.ai" end card
  (last 2 to 3s). Don't name the tutor from the footage alone. Two raw W07 wides (31 Mar) are too
  distant to be useful.
- Cohort 1 professional BTS, shot by Carolina (carioca.au), cleared by Liza 2026-10-22:
  Day 1 (17 Feb) "00_1_1_1_BTS" `1vsT9hTfltTCKzkWzXSlmRCf5PC7SAzbT` (Canon 4K HEVC 50fps
  landscape .MP4 plus CR3 raws) and Day 2 (24 Feb) "00_1_1_day2_BTS"
  `1Z0JHuUiFOQT-e10ZugrXz-zTqbitfinb` (61 .mov clips) and Day 3 (3 Mar) "LIGHTS ON DAY 3"
  `1GnwyWUtg7FeEZ5K8b4sUYYYDTWteLJtU` (CR3 raws and more). Files run up to 23GB, so never download
  whole: read frames and cut segments remotely with ffmpeg (`-http_proxy "$HTTPS_PROXY" -ca_file
  /root/.ccr/ca-bundle.crt`, drive.usercontent.google.com URL). Landscape, so Reels need a 9:16
  crop or pan. A shot log lives with the session scratch work, rebuild it if missing.
- "LO_IMAGES_EDIT" — `1Qs9O3JjwyasvpjH7EiZjUExvEA5ql0bL`

Strategy/partnership source documents also live in Drive (search `fullText contains 'Lights On'`):
Business Plan 2026-2032, CSR Prospects sheet, Stakeholder Matrix, Shift20 Brand Partners sheet.
These are for the strategist's context, not for pulling images from.

## Locked facts (never invent beyond this list — from the `lights-on-partnerships` skill)

- Lights On = screen training initiative, inclusive by design, inside Brock Casting (parent: Brock Up
  Media Pty Ltd). Co-directed by Liza Brock and Breanna Swan.
- Lights On Agency = brand partnerships and content agency, NOT a talent agency. Never call it one.
- Cohort structure: Pilot (5, completed), Cohort 2 (6, completed), Cohort 3 (6, launching Sept
  2026). Standard cohort size from Cohort 2 onward is 6. 2027 target: 4+ cohorts, 40+ cumulative
  participants is a 2027 target, never present as current.
- Program length: 8 weeks, on-camera, with Liza Brock (Casting Director, Brock Casting
  Services) and APAC's Head of Acting (Sean
  Dennehy).
- Confirmed proof points, the ONLY placements to cite: Harry Edmonds (Queensland Government),
  Alex Buchanan (City of Gold Coast), Breanna Swan (Human Nature documentary commercial).
- Strategic partners: indelarts (MOU), APAC (MOU + in-kind), Inclusively Made (strategic),
  Creative Brisbane Collab (network). Bus Stop Films is in talks only, don't present as an
  established Queensland partner.
- Market framing: $13T+ global disposable income of people with disability and their households.
  Frame as "the largest underserved consumer market on the planet." No source citation unless
  Liza supplies one.
- Brock Up Media Pty Ltd is a private company, not a nonprofit. Never call partnership
  contributions tax-deductible donations.
- "Harry With Love" (6-episode series in development) always uses that exact title.
- Confirmed by Liza 2026-10-10 (not yet in the `lights-on-partnerships` skill, flag for sync):
  - Three of five pilot participants have booked paid work (the three placements above), with
    no marketing spend.
  - The 8-week program includes 24 hours on camera.
  - On Lights On productions, at least one in five crew roles are held by disabled crew.

For anything not listed here (a new placement, a new MOU, updated cohort numbers), the writer
agent must flag it as unconfirmed rather than invent or round it.

## Liza's rules from 2026-10-19 (override anything above)

- **Liza Brock is Program Director of Lights On.** On Lights On posts write "Liza Brock, Program
  Director of Lights On and Casting Director at Brock Casting Services". Never "co-director".
- **Name only indelarts and APAC as partners** in public posts. Do not name Inclusively Made or
  Creative Brisbane Collab.
- **Tag the Expo on every Expo post** (organiser's request): Instagram `@disability_expos` (add as
  a collaborator via Blotato `collaborators`, and mention in the caption), Facebook page "Brisbane
  Disability Expo", LinkedIn "Impact Institute". Blotato cannot create linked mentions on Facebook
  or LinkedIn, so flag those for Liza to tag in the app. Official tile:
  `assets/brisbane-disability-expo-2026-tile.jpg`.
- **Expo posts always carry the sign-up link**: "Register free to attend:
  https://brisbanedisabilityexpo.com.au/attend-expo/" on LinkedIn and Facebook, and "Register
  free via the link in our bio." on Instagram.

## Cross promotion: the casting director is always named (Liza's rule, 2026-10-10)

Whenever a post mentions a casting director in the room (in training, on set, in a session,
reading the monitor, giving notes), name her: **Liza Brock, Casting Director at Brock Casting
Services**. Never "a casting director" or "our casting director" unnamed. On Instagram also tag
**@brockcasting**. This is deliberate cross promotion between Lights On and Brock Casting.
It overrides "champion others, not herself" for this one case: naming who is in the room is a
fact, not a boast.

## Voice and punctuation (from `lights-on-brand`)

- Dark, bold, industry-insider voice. Speak to the creative industry, not about disabled people.
- No em dashes or hyphen-as-pause anywhere in copy. Use a full stop or restructure instead.
- **Every post ends with 3-5 hashtags, no exceptions.** Industry-relevant ones
  (#ScreenTraining #InclusiveCasting #BrandPartnerships #QueenslandFilm style). Never
  inspiration-porn hashtags (#overcome, #brave, #warrior).
- No posed-charity photography framing, no medical language.

## Accessibility checklist (Liza's rule, 2026-10-14, from Purple Goat's Social Media Accessibility 101)

Lights On is inclusive by design, so every post has to be accessible. A draft that fails any of
these is incomplete.

1. **Alt text on every image.** 1 to 2 sentences on the overall image and what it represents,
   plus any text on the image written out word for word. Describe what is there, never use
   medical or pity language. Blotato only takes alt text for Instagram (`altText`). For
   LinkedIn and Facebook, the pack flags that Liza can add it in the native app if she wants it.
2. **Hashtags in Camel Case** (#ScreenTraining, never #screentraining), so screen readers
   read them as words.
3. **Colour contrast at least 4.5:1** on any graphic. The brand pairs pass: `#FFD600` on
   `#0D0D0D` and `#FFFFFF` on `#1A1A1A`. Never yellow text on white, never grey on charcoal.
4. **Sans serif type only** on graphics. Poppins and Livvic both qualify.
5. **Captions on every video.** Closed captions in a sans serif typeface, on a contrasting
   neutral background, no wider than about two thirds of the screen.

## Visual identity (from `lights-on-brand`, non-negotiable on every post)

Every Lights On post must carry this identity. Call the `lights-on-brand` skill directly if
it's available in this session. It is not always available in a fired/child session, so these
exact specs are repeated here as the fallback, don't skip them just because the skill didn't load.

**Photos pulled from the Drive library** (the default case): use as-is. Real participants,
real settings, dark studio backgrounds. Never crop, filter, or overlay them in a way that fights
the brand's dark, cinematic tone.

**Any generated graphic** (quote card, stat card, cover tile, anything with text-on-image, e.g.
made in Canva): must follow this spec exactly, no substitutions:

| Role | Hex |
|---|---|
| Lights On Yellow (primary accent, CTAs, headlines) | `#FFD600` |
| Near Black (primary background) | `#0D0D0D` |
| Charcoal (secondary background/cards) | `#1A1A1A` |
| White (text only, never a background) | `#FFFFFF` |

Never Brock Green (`#55BB8B`), that's reserved for the Brock Casting footer link only, not Lights
On content. Never a white or light background.

- Headings/CTAs: Poppins (weights 700-900), uppercase for buttons/labels, tight tracking.
- Body/captions in a graphic: Livvic.
- Buttons: `#FFD600` background with `#0D0D0D` text, or transparent with `#FFD600` outline text,
  5px corner radius, bold uppercase.

If a drafted post would need a new graphic and nothing in the Drive library fits, flag it in the
summary rather than generating an off-brand placeholder.

## Cadence

Weekly (Liza, 2026-10-14). One pack every Monday at 6:52am Brisbane covers Tuesday through next
Monday, with a push notification, and a Monday 4:47pm push nudge only if she hasn't replied. If genuinely
new material lands midweek (a new partner, a booking), raise it in chat as a one-off swap rather
than waiting a week.
