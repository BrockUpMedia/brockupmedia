# Weekly content loop: what to run

This is the prompt the scheduled Routine sends once a week, on Monday at 6:52am Brisbane (Liza
switched from daily to weekly on 2026-10-14). If you're running it manually, follow the same steps.

**Nothing gets published without Liza's explicit approval in chat. Ever.** Blotato has no draft
mode for LinkedIn, Facebook or Instagram: any `blotato_create_post` call goes live. So the weekly
loop never calls it. It produces an APPROVAL PACK and stops. Scheduling only happens on a live
turn where Liza has said yes. (On 2026-08-16 the old Buffer loop published two posts she never
saw. This rule exists so that never happens again.)

**Liza signs off on every image, not just the words** (Liza, 2026-10-14). The pack always shows
her the actual photos, upright and cropped as they will post.

## Weekly steps (attended or unattended)

0. `git pull` in this repo first. Then load the `pulse-social-playbook` skill
   (`.claude/skills/pulse-social-playbook/SKILL.md`) and follow its weekly pack checklist for every
   post: bucket, dream customer, three hooks, one CTA, links checked, plus the engagement round,
   shot list, proof ask, idea bank and last week's numbers at the end of the pack. STRATEGY.md and PLAYBOOK.md get edited in place when facts change.
1. Check `blotato_list_schedules` for Tuesday through next Monday. List the empty slots:
   each day and channel (LinkedIn, Facebook, Instagram) with no post yet.
2. For each day with empty slots, run `lights-on-strategist` with that day's PLAYBOOK theme, then
   pass its brief to `lights-on-writer`. Each returns drafts with CTA, Camel Case hashtags, an
   IMAGE line and an ALT TEXT line. Never reuse an image within the week.
3. Run `lights-on-daily-digest` for last week's status (published, failed, disconnected).
4. **Image proof sheet.** Download every chosen Drive image into a fresh scratch folder, fix the
   rotation (`ImageOps.exif_transpose`), apply the Instagram crop or padding rule, then build ONE
   contact sheet JPEG: each image as a thumbnail labelled with its number, day and channel
   (e.g. "3. Tue LinkedIn"). Send it with `SendUserFile` (display: render) so Liza sees exactly
   what will post.
5. Output the **WEEKLY APPROVAL PACK**, numbered to match the proof sheet:

   ```
   LIGHTS ON WEEKLY PACK, Tue [date] to Mon [date]
   Already booked: [day, channel, one line each]

   1. TUE LINKEDIN, [time] Brisbane. Theme: [playbook theme]
   [full caption]
   Image 1: [Drive file name]   Alt text: [alt text]
   ...

   Digest: [one line headline]
   Reply "go" to schedule all, or approve/edit by number, e.g. "go, swap image 4, hold 6".
   ```

6. Send ONE push notification with `PushNotification`: "Weekly posts ready to approve: [n] posts,
   Tue to Mon. Reply go in Claude." Nothing posts until she replies.

Do NOT run `lights-on-scheduler` as part of the weekly steps.

## Monday afternoon nudge

If the 4:47pm Monday reminder run finds the morning pack still unanswered in chat, send one push:
"Reminder: this week's posts are waiting for your OK. Tuesday's go out tomorrow morning." Say
which posts would miss their time if not approved tonight. If the pack
was already answered, do nothing and say nothing.

## On approval (live turn only)

Engagement replies from the pack are posted with `blotato_post_comment` only for the numbers
Liza approves, exactly as she saw them.

When Liza replies approving the pack (all of it or specific numbers, with or without edits):

1. Apply any edits she asked for. If she swaps an image, show the new image before scheduling.
   If a text edit is more than trivial, show the final text again and get a yes.
2. Run `lights-on-scheduler` with only the approved posts. It uploads the image to Blotato
   and schedules each post with an explicit `scheduledTime`, plus `altText` on Instagram.
3. Report one line per post: scheduled time and image, or what was skipped. Any slot whose time
   has already passed moves to the next free slot for that channel, and the report says so.

If a pack from an earlier week was never approved, ask before scheduling it, the content may be
stale.

## When to leave a slot empty

If the strategist can't find a genuine hook for a day, leave it empty and say so. A gap is fine,
a content-for-content's-sake post is not.

## If something's broken

- `blotato_list_accounts` returns no Lights On accounts: Liza needs to connect them in
  Blotato. Still produce the approval pack, and flag that nothing can be scheduled until they're
  connected.
- `blotato_create_post` fails: check `blotato_get_post_status` for the error. Common causes are a
  missing `pageId` (Facebook, LinkedIn company page) or an Instagram post with no image.
- Can't find recent Drive material: the master folder id is in STRATEGY.md.
- CTA looks wrong: STRATEGY.md is the source of truth, flag any conflict in the pack.
