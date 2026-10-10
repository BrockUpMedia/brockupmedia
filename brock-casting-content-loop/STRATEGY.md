# Brock Casting content loop: strategy brief

Single source of truth for `brock-casting-strategist`, `brock-casting-writer`,
`brock-casting-scheduler` and `brock-casting-daily-digest`. Fix facts here, not in an agent file.

## Goal

**Win casting clients.** Every post exists to make a producer, agency, director or brand think
"I want Liza casting this" and email her. Not talent recruitment, not general awareness. If a
day's angle can't give a client a genuine reason to get in touch, skip the day.

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
- Times (Australia/Brisbane, UTC+10, no daylight saving): LinkedIn 8:15am, Facebook 6pm.
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
