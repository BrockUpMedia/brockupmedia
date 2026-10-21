# Scheduled Routines

Both routines fire **into Liza's existing Claude Code session** (the one that built these loops),
not a fresh session. That session already has the Blotato and Google Drive connectors and this
repo, which a fresh routine session did not carry over.

- **"Weekly social pack (Pulse playbook, all channels)"**: Monday 6:52am Australia/Brisbane. Runs
  the `pulse-social-playbook` skill over every post.
  Follows `lights-on-content-loop/RUN.md` and `brock-casting-content-loop/RUN.md` for Tuesday
  through next Monday, sends the image proof sheet and the approval pack, then a push notification.
  (Was daily at 5:52am until 2026-10-14.)
- **"Monday approval nudge"**: Monday 4:47pm Brisbane. Pushes a reminder only if the morning pack is
  still unanswered.

Nothing is scheduled in Blotato until Liza replies "go" in that session.

An earlier fresh-session version of the routine is disabled. Don't run both.
