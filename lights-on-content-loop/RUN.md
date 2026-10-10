# Daily content loop: what to run

This is the prompt the scheduled Routine sends once a day. If you're running it manually, follow
the same steps.

**Nothing gets published without Liza's explicit approval in chat. Ever.** Blotato has no draft
mode for LinkedIn, Facebook or Instagram: any `blotato_create_post` call goes live. So the daily
loop never calls it. It produces an APPROVAL PACK and stops. Scheduling only happens on a live
turn where Liza has said yes. (On 2026-08-16 the old Buffer loop published two posts she never
saw. This rule exists so that never happens again.)

## Daily steps (attended or unattended)

0. `git pull` in this repo first. STRATEGY.md gets edited in place when facts change.
1. Run `lights-on-strategist`. It returns one angle brief (pillar, hook, source, avoid).
2. Pass that brief to `lights-on-writer`. It returns LinkedIn, Facebook and Instagram drafts,
   each with the platform-correct CTA, hashtags and an IMAGE line.
3. Run `lights-on-daily-digest` for the Blotato status (scheduled, failed, disconnected).
4. Output the **APPROVAL PACK**, which is the thing Liza actually reads:

   ```
   LIGHTS ON APPROVAL PACK [date]
   Angle: [pillar + hook]

   LINKEDIN, goes out [default time] Brisbane
   [full caption]
   Image: [Drive file name]

   FACEBOOK, goes out [default time] Brisbane
   [full caption]
   Image: [Drive file name]

   INSTAGRAM, goes out [default time] Brisbane
   [full caption]
   Image: [Drive file name]

   Digest: [one line headline]
   Reply "go" to schedule all three, or approve/edit specific channels.
   ```

Do NOT run `lights-on-scheduler` as part of the daily steps.

## On approval (live turn only)

When Liza replies approving the pack (all of it or specific channels, with or without edits):

1. Apply any edits she asked for. If an edit is more than trivial, show the final text again
   and get a yes before scheduling.
2. Run `lights-on-scheduler` with only the approved posts. It uploads the Drive image to Blotato
   and schedules each post with an explicit `scheduledTime`.
3. Report one line per channel: scheduled time and image, or what was skipped.

If a pack from an earlier day was never approved, ask before scheduling it, the content may be
stale.

## When to skip the day entirely

If the strategist can't find a genuine hook, skip and say so. A missed day is fine, a
content-for-content's-sake post is not.

## If something's broken

- `blotato_list_accounts` returns no Lights On accounts: Liza needs to connect them in
  Blotato. Still produce the approval pack, and flag that nothing can be scheduled until they're
  connected.
- `blotato_create_post` fails: check `blotato_get_post_status` for the error. Common causes are a
  missing `pageId` (Facebook, LinkedIn company page) or an Instagram post with no image.
- Can't find recent Drive material: the master folder id is in STRATEGY.md.
- CTA looks wrong: STRATEGY.md is the source of truth, flag any conflict in the pack.
