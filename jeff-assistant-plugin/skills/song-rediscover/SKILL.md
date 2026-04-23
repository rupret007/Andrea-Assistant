---
name: song-rediscover
description: Surface forgotten songs — items in Jeff's master catalog that haven't been touched in 6+ months and show signs of being complete or near-complete. Use when Jeff asks "what songs have I forgotten", "find the lost ones", or as part of the monthly forgotten-songs ritual. The antidote to "I wrote hundreds of songs and can't remember half of them."
---

# Song Rediscover

Jeff's big music problem: he writes a lot, starts many, forgets some, and loses track of fully-completed songs because there are too many. This skill is the antidote.

## When to use

- Jeff says "what have I forgotten?"
- Jeff says "surface some old songs for me"
- Monthly scheduled ritual (`monthly-forgotten-songs`)
- When `/andrea-pulse` fires and picks this up as a candidate
- Before a creative block session — might unlock a dormant track he could finish today

## Process

### Step 1 — Load the catalog

Read `memory/music/master-catalog.md`. If empty/thin, also read `song-catalog.md`, `stalemate-songlist.md`, `discography.md`.

### Step 2 — Filter for rediscovery candidates

A song qualifies as a rediscovery candidate if:

- `priority: forgotten` (no touch > 6 months)
- AND `status` is `sketch | wip | demo | mixed` (has substance — fragments aren't rediscoverable, they're just starts)
- AND not already `released`

Bonus qualification signals:
- Has multiple file versions (suggests Jeff put real work in)
- Has a finished lyric doc (means the words are done)
- Is `mixed` but not `released` (ghost track — should have gone out, didn't)
- Band association is active (Rad Dad, currently-paused Stalemate)

### Step 3 — Rank

Prioritize by:
1. **`mixed` but unreleased** — these are the biggest losses
2. **`demo` with complete lyric doc** — ready-to-record, forgotten
3. **`wip` with last-touched > 12 months** — classic abandoned song
4. **Multi-version `sketch`** — has momentum, just stalled

Return the top 3–5. Not more — the goal is rediscovery, not overwhelm.

### Step 4 — Present with context

Format:

```
🕰 **Songs you might have forgotten**

### 1. {Song Title}
{One-line evocative hook — pull from lyric doc's first line or title itself}
- Status: {status}, last touched {date}
- Band: {band}
- Files: {list with links}
- **Why this one:** {specific reason Andrea flagged it — "you had a v1.4 mix and never released it"}

(repeat for top 3-5)

Want to pick one up? Options:
- /focus-sprint on {song} to push it forward
- Share with {band} via /band-comms
- /release-day if it's actually ready
- "leave it" — Andrea won't resurface this one for 90 days
```

### Step 5 — Handle Jeff's response

- **"Let's work on {song}"** → invoke `/focus-sprint` with that song as the goal, load its files into context
- **"Send to Travis"** → invoke `/band-comms` with context
- **"Leave it"** → log a "don't resurface until {date 90 days out}" in `memory/music/rediscovery-pauses.md`
- **"What else?"** → show 3 more candidates, but don't do this more than twice per session (rediscovery fatigue is real)

## Rules

- **Max 5 songs per run.** Rediscovery should feel precious, not overwhelming.
- **Always specify WHY this song was surfaced.** "It's old" isn't a reason; "you had a finished mix that never shipped" is.
- **Respect the "leave it" response.** If Jeff says pass, don't resurface that song for 90 days. Track these in `memory/music/rediscovery-pauses.md`.
- **Don't resurface the same song within a 60-day window.** Even if not explicitly paused.
- **Prefer songs with evidence of real work** — multi-version demos, mixed but unreleased, complete lyrics — over barely-started sketches.

## Memory

- Reads: `memory/music/master-catalog.md`, `memory/music/song-catalog.md`, `memory/music/discography.md`, `memory/music/stalemate-songlist.md`, `memory/music/rediscovery-pauses.md`
- Writes: `memory/music/rediscovery-pauses.md` (when Jeff says "leave it")
