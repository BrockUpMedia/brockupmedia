# Daily content loop: what to run

This is the prompt the scheduled Routine sends once a day. It chains the three sub-agents in
order. If you're running this manually instead of via the Routine, follow the same steps.

## Steps

0. `git pull` in this repo first. This session's working copy can go stale between runs;
   STRATEGY.md gets edited in place when facts change, so pull before reading it.
1. Run the `lights-on-strategist` agent. It returns one angle brief (pillar, hook, source,
   what to avoid repeating).
2. Pass that brief to the `lights-on-writer` agent. It returns three drafts: LinkedIn, Facebook,
   Instagram, each with the platform-correct CTA.
3. Pass those three drafts to the `lights-on-scheduler` agent. It checks the Buffer queue against
   the 10-post cap and submits what fits as a Buffer draft (never auto-published), reporting
   what was drafted and what (if anything) was skipped because of the cap. **If this fires
   unattended and `create_post` gets denied**, that's expected (see below), not a bug to chase.
4. Run the `lights-on-daily-digest` agent. It checks everything currently sitting as draft or
   pending approval in Buffer (today's new drafts plus anything from previous days still
   unactioned) and produces the reminder that tells Liza what needs her to press send.
5. Summarize the run in 3-5 lines: the angle used, what's now pending her approval and where, and
   the digest's headline (anything overdue, or "all clear"). This is what shows up as the day's
   result, and it's the thing Liza actually reads.

## When to skip the day entirely

If the strategist can't find a genuine hook (nothing recent in Drive, every pillar was used
in the last few days, nothing in STRATEGY.md fits), skip posting rather than forcing a filler
post. Say so in the summary. A missed day is fine, a content-for-content's-sake post is not,
that's the whole point of this system.

## If something's broken

- **`create_post` denied by a permission classifier**: this is expected when the loop fires
  unattended (nobody live in the conversation), confirmed 2026-08-16. It is NOT fixable by
  granting a standing permission, self-editing settings.json is blocked by the same classifier.
  Don't retry, don't investigate it as a bug. Instead: report the drafted captions in full so
  nothing is lost, and note that Buffer drafts will get created on the next live turn. On that
  next live turn (any message from Liza, not necessarily about the loop), check for anything
  reported-but-not-yet-created and offer to push it to Buffer then, it will work because a human
  is now present.
- Buffer `create_post` failing on every channel even when live: check
  `mcp__Buffer__get_account` for the current `limits.scheduledPosts`, the cap in STRATEGY.md may
  be out of date. Also check Facebook/Instagram calls include the required `metadata.type` field
  (see lights-on-scheduler.md), missing it causes a rejection that looks similar.
- Can't find recent Drive material: the master folder id is in STRATEGY.md, search under it
  directly if the general search comes up short.
- CTA looks wrong or outdated: STRATEGY.md is the source of truth, if the CTA there conflicts
  with something else you've seen, trust STRATEGY.md and flag the conflict in the summary.
