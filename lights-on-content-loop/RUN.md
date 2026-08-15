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
   the 10-post cap and queues what fits, reporting what was queued and what (if anything) was
   skipped because of the cap.
4. Summarize the run in 3-5 lines: the angle used, what was queued where and when, and the
   current total queued count against the cap. This is what shows up as the day's result.

## When to skip the day entirely

If the strategist can't find a genuine hook (nothing recent in Drive, every pillar was used
in the last few days, nothing in STRATEGY.md fits), skip posting rather than forcing a filler
post. Say so in the summary. A missed day is fine, a content-for-content's-sake post is not,
that's the whole point of this system.

## If something's broken

- Buffer `create_post` failing on every channel: check `mcp__Buffer__get_account` for the
  current `limits.scheduledPosts`, the cap in STRATEGY.md may be out of date.
- Can't find recent Drive material: the master folder id is in STRATEGY.md, search under it
  directly if the general search comes up short.
- CTA looks wrong or outdated: STRATEGY.md is the source of truth, if the CTA there conflicts
  with something else you've seen, trust STRATEGY.md and flag the conflict in the summary.
