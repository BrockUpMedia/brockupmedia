# Lights On content loop

An automated system that plans, writes, and queues Lights On brand-partnership social content
to Buffer, on a daily loop, without turning into content-for-content's-sake.

## How it's structured

Three sub-agents, each with one job, chained in order:

1. **`lights-on-strategist`** (`.claude/agents/lights-on-strategist.md`) — picks the day's
   content angle from a rotating set of pillars, checks what's already queued so it doesn't
   repeat, and pulls in anything genuinely new from the content library.
2. **`lights-on-writer`** (`.claude/agents/lights-on-writer.md`) — turns that angle into three
   platform-native captions (LinkedIn, Facebook, Instagram), each carrying the correct call to
   action for that platform, in Lights On's brand voice.
3. **`lights-on-scheduler`** (`.claude/agents/lights-on-scheduler.md`) — checks Buffer's queue
   against the account's 10-post cap and queues what fits, reporting what was skipped if
   anything was.

`STRATEGY.md` is the shared brief all three read: the CTA URL, the Buffer channel and cap
details, the content library folder ids, the locked facts they're not allowed to invent beyond,
and the brand voice rules. Update it there and all three agents pick up the change on their next
run.

`RUN.md` is the entry point: the exact steps for one day's loop, in order.

## The loop

A scheduled Routine fires into a dedicated session once a day and sends it the instruction in
`RUN.md`. That session has this repo checked out, so the three agents and the strategy brief are
right there. Each run: pick an angle, write three drafts, queue what the Buffer cap allows,
report back.

## Why it's not just "post daily on autopilot"

The Buffer plan on this account caps out at 10 scheduled posts total. Posting daily across all
three channels would try to queue faster than that cap allows within a week. The scheduler tops
up a rolling 2-3 day buffer per channel instead of batching ahead, and the strategist will skip a
day rather than force a filler post when there's nothing genuine to say. If you want a heavier
cadence, the Buffer plan needs to move first, that's a real ceiling, not a setting in this repo.

## Keeping it accurate

`STRATEGY.md`'s locked facts section mirrors the `lights-on-partnerships` skill. If a new
placement, MOU, or cohort figure gets confirmed, update `STRATEGY.md` (and flag the skill file
for the same update, so both stay in sync).
