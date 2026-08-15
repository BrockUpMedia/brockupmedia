# Setting up the real scheduled Routine (do this from claude.ai, not from me)

I can't create this one myself: this org's Routine/trigger system, when driven through my tools,
can't carry your Buffer and Google Drive connector access into the session it fires. Three test
fires confirmed it, every one came back with zero connector tools. Creating the Routine directly
from claude.ai's own UI may attach your connectors correctly, since that's a different path than
the one I'm restricted to. Worth 5 minutes to try, since it gives you real unattended automation
instead of the send_later chain I'm running as a stand-in.

## Steps

1. Go to claude.ai/code (or wherever your Routines/scheduled tasks list lives in your Claude
   plan) and find "Routines" or "Scheduled tasks."
2. Create a new Routine.
3. **Repository**: `BrockUpMedia/brockupmedia`, branch `main`.
4. **Schedule**: daily, 6:00am Australia/Brisbane (Brisbane has no daylight saving, so this is a
   fixed UTC 20:00 every day if the UI asks for UTC instead of a named timezone).
5. **Prompt to paste in**:

   ```
   cd into this repo, git pull, then follow lights-on-content-loop/RUN.md exactly: run
   lights-on-strategist, then lights-on-writer, then lights-on-scheduler, then
   lights-on-daily-digest, in that order. Report the 3-5 line summary RUN.md describes.
   ```

6. **Connectors**: when the Routine setup asks which connectors/tools the fired session can use,
   grant Buffer and Google Drive explicitly. This is the step that failed when I tried it
   programmatically, if the UI has an equivalent option, that's the one to watch.
7. Save it, then use the UI's "run now" or "test" option if there is one, and check whether the
   fired run actually shows Buffer/Drive tool calls succeeding (not just "ran successfully" with
   empty output). If it does, you've got working unattended automation and can tell me to retire
   the send_later chain. If it still comes back with no connector access, this is a hard platform
   limit right now, not something either of us is doing wrong, and the send_later chain stays as
   the working option.
