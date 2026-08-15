# Lights On content loop: strategy brief

This is the single source of truth the three agents (`lights-on-strategist`, `lights-on-writer`,
`lights-on-scheduler`) read before doing anything. Keep it current. If a fact here goes stale,
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

## Buffer setup (as of 2026-08-15)

- Organization: "My Organization", id `6a3e0fd9307ac73dea85b3f4`
- **Plan cap: 10 scheduled posts total, across all channels.** This is the hard constraint the
  scheduler agent works around. If Liza upgrades the Buffer plan, raise this number here.
- Channels:
  - LinkedIn — "Lights On Agency Qld", id `6a4615c85ab6d2f106963238`
  - Facebook — "Lights On QLD", id `6a5dc3e9e2638b94d79dc524`
  - Instagram — "lightsonqld", id `6a5dc422e2638b94d79dc5c3`
- Target queue depth: ~2-3 days per channel, topped up daily. Not a bulk weekly dump, the 10-post
  cap doesn't allow it across 3 channels at daily cadence.

## Content library (Google Drive)

Master folder: "LIGHTS ON MASTER FOLDER" — `1xD6SUdRajhG998qSAdm1h5NwFgCkCRIH`

Useful subfolders found there:
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

For anything not listed here (a new placement, a new MOU, updated cohort numbers), the writer
agent must flag it as unconfirmed rather than invent or round it.

## Voice and punctuation (from `lights-on-brand`)

- Dark, bold, industry-insider voice. Speak to the creative industry, not about disabled people.
- No em dashes or hyphen-as-pause anywhere in copy. Use a full stop or restructure instead.
- No inspiration-porn hashtags (#overcome, #brave, #warrior). Use industry-relevant tags.
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

Daily. The loop tops up Buffer's queue once a day rather than batching a week at a time, both
because of the 10-post cap and because it lets the strategist react to genuinely new material
(a new cohort photo, a new placement) instead of pre-writing a week of content that goes stale.
