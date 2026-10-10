# Scheduled Routine

Since 2026-10-10 the routine **"Daily content packs (Lights On + Brock Casting)"** fires every
day at 5:52am Australia/Brisbane **into Liza's existing Claude Code session** (the one that built
these loops), not a fresh session. That session already has the Blotato and Google Drive
connectors and this repo, which a fresh routine session did not carry over.

Each run follows `lights-on-content-loop/RUN.md` daily, plus `brock-casting-content-loop/RUN.md`
on Monday, Wednesday and Friday, and ends with the approval pack(s). Nothing is scheduled in
Blotato until Liza replies "go" in that session.

An earlier fresh-session version of the routine (same name) is disabled. Don't run both.
