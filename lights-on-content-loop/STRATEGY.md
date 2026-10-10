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
- No 10-post cap any more. Target is still a rolling 2-3 days per channel, never a bulk dump.
- Default posting times (Australia/Brisbane, UTC+10, no daylight saving), the next free day after
  approval: LinkedIn 7:45am, Facebook 6pm, Instagram 6pm (matching the times Liza already uses). Change them here, not in an agent file.

### Approval gate (non-negotiable)

**Blotato has no draft mode for LinkedIn, Facebook or Instagram. Anything sent to
`blotato_create_post` is either published immediately or scheduled to go live.** So the gate now
lives in the conversation, not in the scheduling tool:

1. The daily loop drafts captions and picks images, then outputs an **APPROVAL PACK** in chat.
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

Do not guess who is pictured in any of these. No name is confirmed from the photo alone, if a
post needs to name someone, that name must come from STRATEGY.md's locked facts, not an assumption
about who's in a photo.

Older subfolders (check only if the primary folder doesn't have something that fits):
- "Lights On - Cohort 2 Social Assets" — `1elqVjuA6bLcq931im3TLXqcSGyMnpGUI` (most recent, prefer
  for current cohort content)
- "Lights On BRAND" — `1Vvc8vU31wNIfANI7se5lP6R2gZav9LeC` (logos, brand assets)
- "LIGHTS ON MARKETING" — `1FfMi2YscHjDrOTn6sk1iTh9zUuoStVFx`
- "00_1_Cohort 1 Social Media" — `17NDnWbtPX8JvREjQxHqOpiDN5ec0FmgN`
- "LO_IMAGES_EDIT" — `1Qs9O3JjwyasvpjH7EiZjUExvEA5ql0bL`

Strategy/partnership source documents also live in Drive (search `fullText contains 'Lights On'`):
Business Plan 2026-2032, CSR Prospects sheet, Stakeholder Matrix, Shift20 Brand Partners sheet.
These are for the strategist's context, not for pulling images from.

## Locked facts (never invent beyond this list — from the `lights-on-partnerships` skill)

- Lights On = disability-led screen training initiative, inside Brock Casting (parent: Brock Up
  Media Pty Ltd). Co-directed by Liza Brock and Breanna Swan.
- Lights On Agency = brand partnerships and content agency, NOT a talent agency. Never call it one.
- Cohort structure: Pilot (5, completed), Cohort 2 (6, completed), Cohort 3 (6, launching Sept
  2026). Standard cohort size from Cohort 2 onward is 6. 2027 target: 4+ cohorts, 40+ cumulative
  participants is a 2027 target, never present as current.
- Program length: 8 weeks, on-camera, with a casting director and APAC's Head of Acting (Sean
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

## Voice and punctuation (from `lights-on-brand`)

- Dark, bold, industry-insider voice. Speak to the creative industry, not about disabled people.
- No em dashes or hyphen-as-pause anywhere in copy. Use a full stop or restructure instead.
- **Every post ends with 3-5 hashtags, no exceptions.** Industry-relevant ones
  (#ScreenTraining #InclusiveCasting #BrandPartnerships #QueenslandFilm style). Never
  inspiration-porn hashtags (#overcome, #brave, #warrior).
- No posed-charity photography framing, no medical language.

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

Daily. The loop prepares one approval pack a day rather than batching a week at a time, because it lets the strategist react to genuinely new material
(a new cohort photo, a new placement) instead of pre-writing a week of content that goes stale.
