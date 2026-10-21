# Brock Casting content loop: what to run

Runs weekly on Monday morning with the Lights On pack (since 2026-10-14), drafting that week's
Wednesday and Friday and the next Monday's posts in one go: run the steps below once per post day with no post yet,
and put all of them in one BROCK CASTING section of the weekly pack, after Lights On. Text only,
so no images to sign off. Same approval rule as Lights On: **nothing goes live without
Liza's explicit yes in chat.** Blotato has no draft mode, so the loop never calls
`blotato_create_post`.

## Steps per post day (attended or unattended)

0. `git pull` in this repo. Follow the `pulse-social-playbook` skill for buckets, the dream
   customer (Tom), three hooks per post, one CTA and the engagement round.
1. Run `brock-casting-strategist`. It returns one angle brief.
2. Pass it to `brock-casting-writer`. It returns a LinkedIn and a Facebook draft, text only.
3. Run `brock-casting-daily-digest` for Blotato status on the Brock Casting pages.
4. Output the APPROVAL PACK:

   ```
   BROCK CASTING APPROVAL PACK [date]
   Angle: [pillar + hook]

   LINKEDIN (BROCK CASTING SERVICES page), goes out [day] 12:15pm Brisbane
   [full caption]

   FACEBOOK (Brock Casting Services Brisbane), goes out [day] 6pm Brisbane
   [full caption]

   Unconfirmed: [anything the writer flagged, or none]
   Digest: [one line]
   Reply "go" to schedule both, or approve/edit one.
   ```

If Lights On runs the same day, send both packs together, Lights On first, so Liza approves in
one go. Keep them clearly separated: the brands must never cross.

Do NOT run `brock-casting-scheduler` as part of these steps.

## On approval (live turn only)

1. Apply any edits. If more than trivial, show the final text and get a yes.
2. Run `brock-casting-scheduler` with only the approved posts.
3. Report one line per channel.

## Skip the day

No genuine client-facing angle, skip and say so. A missed day beats a filler post.
