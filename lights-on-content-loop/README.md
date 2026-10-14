# Lights On content loop

An automated system that plans and writes Lights On brand-partnership social content daily,
then schedules it in Blotato once Liza approves it, without turning into content-for-content's-sake.

## How it's structured

Four sub-agents, each with one job, chained in order:

1. **`lights-on-strategist`** (`.claude/agents/lights-on-strategist.md`) — picks the day's
   content angle from a rotating set of pillars, checks what's already queued so it doesn't
   repeat, and pulls in anything genuinely new from the content library.
2. **`lights-on-writer`** (`.claude/agents/lights-on-writer.md`) — turns that angle into three
   platform-native captions (LinkedIn, Facebook, Instagram), each carrying the correct call to
   action for that platform, in Lights On's brand voice.
3. **`lights-on-daily-digest`** (`.claude/agents/lights-on-daily-digest.md`) — checks Blotato
   for what's scheduled to go live, what published, what failed, and whether the accounts are
   still connected.
4. **`lights-on-scheduler`** (`.claude/agents/lights-on-scheduler.md`) — runs only after Liza
   approves the day's APPROVAL PACK in chat. Uploads the Drive image to Blotato and schedules
   each approved post with an explicit time.

Nothing this system writes goes live on its own. Blotato has no draft mode for LinkedIn,
Facebook or Instagram, so the approval gate lives in the chat: the daily run ends with an
approval pack, and nothing reaches Blotato until Liza says go.

`PLAYBOOK.md` is the 90-day plan: weekly rhythm, CTA ladder and phases. Strategist and writer read it every run.

`STRATEGY.md` is the shared brief all four read: the CTA URL, the Blotato account ids,
posting times and approval rules, the content library folder ids, the locked facts they're not allowed to invent beyond,
and the brand voice rules. Update it there and all four agents pick up the change on their next
run.

`RUN.md` is the entry point: the exact steps for one day's loop, in order.

## The loop

A scheduled Routine fires into a dedicated session once a day and sends it the instruction in
`RUN.md`. That session has this repo checked out, so the four agents and the strategy brief are
right there. Each run: pick an angle, write three drafts, check Blotato status, post the
approval pack. Liza replies "go" and the scheduler books the approved posts.

## Why it's not just "post daily on autopilot"

The strategist will skip a day rather than force a filler post when there's nothing genuine to
say, and every post waits for Liza's yes. The aim is fewer, better partner-facing posts, not
volume.

## Keeping it accurate

`STRATEGY.md`'s locked facts section mirrors the `lights-on-partnerships` skill. If a new
placement, MOU, or cohort figure gets confirmed, update `STRATEGY.md` (and flag the skill file
for the same update, so both stay in sync).
