---
name: song-search
description: Search Jeff's master music catalog by title, theme, status, band, or any combination. Use when Jeff says "do I have a song about X", "what songs are at wip status", "show my Rad Dad originals", "what have I written in A minor", "find that song I started last summer". Returns matches with cross-references to lyric docs, demos, mixes, and released versions.
---

# Song Search

The query layer for Jeff's master catalog. He has too many songs to remember. This skill finds what he's looking for fast.

## When to use

- "Do I have a song about {theme}?"
- "What songs are at {status}?"
- "Show my Rad Dad originals"
- "What's in the key of X?"
- "Find that song I started last summer"
- "Songs with the word {word} in the title"
- Any retrieval request that needs to index his catalog

## Process

### Step 1 — Classify the query

What's Jeff looking for?

- **By title** — exact or fuzzy match on song name
- **By theme** — the lyrical subject matter (love, pride, loss, politics, humor)
- **By status** — fragment, sketch, wip, demo, mixed, released
- **By band** — Rad Dad, Stalemate, solo, collaboration
- **By key/tempo** — musical parameters
- **By timeframe** — songs from 2023, songs worked on last month, etc.
- **By related** — "everything that uses the chord progression from X"
- **By combination** — "Stalemate wips in A minor"

### Step 2 — Read the catalog

Load `memory/music/master-catalog.md`. If this catalog is empty or thin, fall back to:
- `memory/music/song-catalog.md` (Drive inventory)
- `memory/music/stalemate-songlist.md`
- `memory/music/rad-dad-setlist.md`
- `memory/music/discography.md`

### Step 3 — Filter and return

Return matches in this format:

```
🎵 **Song search — "{query}"**

**{N} matches**

### {Song Title}
Band: {...} · Status: {...} · Key: {...} · Last touched: {...}
Files: [lyric]({url}) · [demo]({url}) · [released]({url})
{one-line note if relevant}

(repeat per match)

**No matches?** Ranked nearby options: {fuzzy matches}
```

### Step 4 — Offer next actions

Based on what's returned:
- "Want me to open the lyric doc?"
- "Want to pick one up via /focus-sprint?"
- "Want to capture a new version via /lyric-vault?"
- "Is any of this released? Want me to `/release-day` it?"

### Step 5 — Handle empty / ambiguous results

- If no match: propose similar titles, offer to add as a new entry
- If too many matches: narrow by asking one clarifying question

## Rules

- **Never invent songs.** If the catalog doesn't have it, say so.
- **Show file links.** Don't describe — link. Jeff can open himself.
- **Respect Drive permissions.** Link to files Jeff has access to.
- **Keep responses scannable.** Max 10 matches per response; paginate if more.

## Memory

- Reads: all `memory/music/*.md` files
- Writes: nothing (read-only query skill)
