# Brock Casting content loop: what to run

Runs Monday, Wednesday and Friday. Same approval rule as Lights On: **nothing goes live without
Liza's explicit yes in chat.** Blotato has no draft mode, so the loop never calls
`blotato_create_post`.

## Post-day steps (attended or unattended)

0. `git pull` in this repo.
1. Run `brock-casting-strategist`. It returns one angle brief.
2. Pass it to `brock-casting-writer`. It returns a LinkedIn and a Facebook draft, text only.
3. Run `brock-casting-daily-digest` for Blotato status on the Brock Casting pages.
4. Output the APPROVAL PACK:

   ```
   BROCK CASTING APPROVAL PACK [date]
   Angle: [pillar + hook]

   LINKEDIN (BROCK CASTING SERVICES page), goes out [day] 8:15am Brisbane
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
