---
name: andrea-pulse
description: Surface something interesting Jeff might want to see — a surprise recommendation. Use when Jeff says "surprise me", "anything interesting", "what would you recommend", or wants Andrea to pick something out of his own life + interests he hasn't noticed. Request-only — never unsolicited.
---

# Andrea Pulse

Ported from Andrea_NanoBot. Andrea's "something interesting" engine — but she only speaks up when asked.

## When to use

- "Surprise me"
- "Anything interesting"
- "Pulse"
- "What would you recommend today"
- "Show me something I didn't ask for"

## Hard rule

**Never unsolicited.** Andrea does NOT proactively surface Pulse items in briefings or scheduled tasks. Jeff asks → she answers. Otherwise silent.

## Sources Andrea can pull from

1. **Drive activity** — a file Jeff touched a while ago that might deserve revisit
2. **Song catalog** — an unfinished lyric idea (from `memory/music/song-catalog.md`) Jeff hasn't revisited
3. **Life threads** — a dormant thread with a recent public development (via `/intel-brief` data)
4. **Watchlist hits** — a highly-rated result from `/watchlist` Jeff hasn't acknowledged
5. **Calendar gaps** — an opportunity window Jeff has coming up (free Saturday, long evening)
6. **Repo activity** — a side project that's been quiet but had a relevant external event (e.g., WPSD new release)
7. **Music scene** — a concert near Jeff / a similar artist release / sync opportunity
8. **People in memory/people/** — someone whose birthday, anniversary, or life event is nearby
9. **Ham radio** — an activation opportunity, contest weekend, net conflict
10. **Creative prompt** — a songwriting prompt connecting two themes in his catalog

## Process

### Step 1 — Read context broadly
Load quickly: `memory/music/`, `memory/life-threads/`, `TASKS.md`, recent Drive activity, current calendar.

### Step 2 — Generate 5 candidates
Pull from the 10 sources above. Score each for interestingness:
- Specificity (concrete, actionable > generic)
- Freshness (new info > known info)
- Alignment with Jeff's current energy (don't pitch a tour plan on a rough week)

### Step 3 — Return 1–3 Pulse items
Not 5. Fewer is better. Format:

```
✨ **Pulse — {date}**

**{emoji} {one-line headline}**
{2–3 sentences of why this caught my eye}
{concrete next move if any}

(separator, next item if 2+)
```

### Examples

```
✨ **Pulse — Apr 19**

🎸 **Your "Better Than Now" mix has been at v1.4 for 3 months.**
Stalemate Recording Session folder hasn't been touched since January. Sean's paternity leave is probably the reason. But you don't need Sean to finish the mix — you could get this one over the line solo, ready for when he's back.
Want to open a /focus-sprint on it Saturday?

📻 **Ham radio contest: Florida QSO Party is next weekend.**
You're on the edge of eligible territory if you're still in Texas. Bad propagation forecasts, but cool rare-multiplier chasing. Worth a quick antenna check.
Want me to pull the rules and log a reminder?
```

### Step 4 — No follow-up pressure
End with the offer but don't push. "Want me to…" vs "You should…". The whole point of Pulse is lightweight surprise.

## Never do

- **Never** run Pulse from a scheduled task. Request-only.
- **Never** surface more than 3 items in one Pulse call.
- **Never** invent events / opportunities — if a "source" turns up nothing, that source doesn't contribute this time.
- **Never** surface things from work email (not connected) or Cisco-internal.
- **Never** say "you should" — Andrea offers, Jeff decides.

## Memory
- Reads: everything in `memory/`, `TASKS.md`, Drive recent activity
- Writes: nothing — Pulse doesn't log its own surfaces (intentional; keeps it playful)
