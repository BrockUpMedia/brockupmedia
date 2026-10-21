# Brock Casting content loop: strategy brief

Single source of truth for `brock-casting-strategist`, `brock-casting-writer`,
`brock-casting-scheduler` and `brock-casting-daily-digest`. Fix facts here, not in an agent file.

## Goal

**Win casting clients.** Every post exists to make a producer, agency, director or brand think
"I want Liza casting this" and email her. Not talent recruitment, not general awareness. If a
day's angle can't give a client a genuine reason to get in touch, skip the day.

## Positioning (Liza, 2026-10-21)

Inclusive by design, but Brock Casting casts everything: commercials, TV, film, brand and real
people. Most producers and agency people already have a casting director, so posts build awareness
and show range so Liza is front of mind for the next brief. Never frame Brock Casting as only an
inclusive or disability casting service.

## Call to action

**Every post ends with a direct email ask to `hello@brockcasting.com.au`.** Phrase it as an
invitation, in Liza's voice, e.g. "Got a project coming up? hello@brockcasting.com.au". Vary
the wording, never the address. No website links in the CTA.

## Blotato setup

Same Blotato workspace as Lights On (verified 2026-10-10).

- LinkedIn: accountId `38690`, company page "BROCK CASTING SERVICES" pageId `100888878`.
  Always pass the pageId, or it posts to Liza's personal profile. Primary channel.
- Facebook: accountId `57070`, page "Brock Casting Services Brisbane" pageId
  `236990256158164` (required).
- No Brock Casting Instagram is connected in Blotato. LinkedIn and Facebook only. No TikTok.
- **Never** use the Lights On pages (LinkedIn `133063933`, Facebook `1159899887215852`,
  Instagram `77116`) for Brock Casting content.

### Cadence and times

- 3 posts a week per channel: Monday, Wednesday, Friday. One idea per post day, written
  natively for each channel.
- Times (Australia/Brisbane, UTC+10, no daylight saving): LinkedIn 12:15pm, Facebook 6pm, on the
  same post day. The pack lands around 6am, so this leaves the morning to approve. If approval
  comes after a slot has passed, schedule that channel for the next post day instead.
- Change these here, not in an agent file.

### Approval gate (non-negotiable)

Blotato has no draft mode for LinkedIn or Facebook. Anything sent to `blotato_create_post` goes
live. So:

1. The loop drafts and outputs an **APPROVAL PACK** in chat. It never calls
   `blotato_create_post`, attended or not.
2. Only after Liza explicitly approves in chat does `brock-casting-scheduler` schedule the
   approved posts, always with an explicit `scheduledTime`.
3. Approval covers only the exact text she saw. Any change, show it again.

### Images

**Text only for now** (Liza's call, 2026-10-10). Do not pull images from Drive for this loop.
The main BROCK CASTING Drive folder holds talent headshots, quotes and contracts, none of which
is cleared for social. If Liza later sets up a cleared image folder, record its id here first.

## Locked facts (never invent beyond this list)

From the `brock-casting-brand` skill:

- Brock Casting Services is Queensland's only disability-led casting agency.
- Founder and director: Liza Brock. 30+ years in the Australian entertainment industry.
- Brisbane-based, works nationally. Film, TV, commercial casting.
- Tagline: "Your Story. Perfectly Cast."
- Lights On is the screen training initiative for disabled creatives Liza co-directs with
  Breanna Swan. For any Lights On fact, use the locked list in
  `lights-on-content-loop/STRATEGY.md`, nothing else.

**Clients, productions and talent are confidential by default.** Never name a client, brand,
production, project, or performer, and never describe a current job, unless Liza supplies the
name in chat for that post and confirms it's public. Drive holds deal memos, quotes and
contracts: they are not content sources. Do not mine them for posts.

Anything not on this list (a booking, a credit, a number): flag it as unconfirmed in the pack,
never invent or round it.

## Cross promotion: the casting director is always named (Liza's rule, 2026-10-10)

Whenever a post mentions a casting director in the room (in training, on set, in a session,
reading the monitor, giving notes), name her: **Liza Brock, Casting Director at Brock Casting
Services**. Never "a casting director" or "our casting director" unnamed. On Instagram also tag
**@brockcasting**. This is deliberate cross promotion between Lights On and Brock Casting; on Brock Casting posts about Lights On or
any session, the casting director is still named this way.
It overrides "champion others, not herself" for this one case: naming who is in the room is a
fact, not a boast.

## Voice (from `brock-casting-brand`, non-negotiable)

- Warm, bold, direct, fun, industry insider who brings people in.
- **She champions others, never herself.** No posts framing a casting win as Liza's achievement.
  No "thrilled to announce".
- **No em dashes, no hyphen-as-pause, no emoji.** Anywhere.
- Passes the "could any agency have written this?" test. If yes, rewrite.
- LinkedIn: warm professional, thought-provoking, full sentences, personal voice.
- Facebook: warmer, more conversational, shorter.
- 3-5 relevant hashtags at the end, e.g. #CastingDirector #InclusiveCasting #QueenslandFilm
  #BrisbaneFilm #Brisbane2032. Work SEO terms in naturally where they fit: casting director
  Brisbane, casting agency Queensland, inclusive casting Australia.

## Liza's headshot (2026-10-15)

If a post ever shows Liza, use `assets/liza-brock-headshot-glasses.jpg` (she wears glasses, so
never an older headshot without them).

## Commercial timelines (Liza, 2026-10-19)

Commercial casting moves in days, not weeks. Never suggest clients book four to six weeks out.
Expo posts carry: "Register free to attend: https://brisbanedisabilityexpo.com.au/attend-expo/"

## Accessibility (Liza's rule, 2026-10-14, from Purple Goat's Social Media Accessibility 101)

- Hashtags in Camel Case (#CastingDirector, never #castingdirector), so screen readers read them.
- If an image is ever added: 1 to 2 sentences of alt text, plus any text on the image written
  out. On graphics, use colour contrast of at least 4.5:1 and sans serif type only.
- Every video carries closed captions in a sans serif typeface, on a contrasting neutral
  background, no wider than about two thirds of the screen.

## Content pillars (client-facing framing)

1. **Industry insight.** Generous, practical casting know-how for producers and brands: how to
   brief a casting director, timelines, self-tapes, real people casting, what makes a great
   brief. This is the main client-winning pillar.
2. **Inclusive casting as a production advantage.** What authentic inclusion looks like on set
   and why it makes better work. Specific and informed, never performative.
3. **Queensland as a screen destination.** Talent, locations, Brisbane 2032 momentum. Why
   shooting and casting locally works.
4. **Queensland talent love.** Only with a name and story Liza supplies. Never from Drive.
5. **Lights On connection.** Human impact first, program mechanics second. Locked Lights On
   facts only.

Rotate. Don't repeat a pillar two post days running.
