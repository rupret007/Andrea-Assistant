---
name: voice-memo-ingest
description: Process voice memo files Jeff has exported from iPhone to a designated Drive folder. Transcribes, classifies as fragment/sketch, infers theme, and adds to master catalog. Use when Jeff says "ingest my voice memos", "process the voice-memos folder", or when he's just finished bulk-exporting from iPhone. Turns the black-box of his iPhone Voice Memos into a searchable archive.
---

# Voice Memo Ingest

Jeff's iPhone Voice Memos holds years of song ideas that vanish into the void. This skill turns that into a queryable music archive.

## Prerequisites — Jeff needs to do this first

Voice memos don't automatically sync to Drive. Jeff has to export them. Instructions (one-time setup on iPhone):

1. **Create a Drive folder** called `Voice Memos` (or similar) — give him the Drive URL
2. **Install Google Drive iOS app** if not already
3. **Bulk export from iPhone Voice Memos app:**
   - Open Voice Memos
   - Select memos (long-press, then tap to select additional)
   - Tap Share → Save to Drive → pick the Voice Memos folder
4. **Or: iOS Shortcut for auto-export** (more advanced) — a Shortcut that fires weekly and batch-exports new memos

Once voice memos are in Drive, this skill can process them.

## When to use

- Jeff says "ingest my voice memos"
- Jeff says "process the voice-memos folder"
- After he's just done a bulk export ("I just dumped ~30 memos in Drive")
- Monthly scheduled ritual (consider: `monthly-voice-memo-ingest`)

## Process

### Step 1 — Locate the folder

Ask Jeff: "Which Drive folder? Default is searching for folders named 'Voice Memos'." Use Drive `search_files` with `title contains 'voice memo'` or similar.

If uncertain, ask for the folder URL explicitly.

### Step 2 — Enumerate new memos

For each audio file in the folder (`.m4a` usually from iPhone):

- Get metadata: title (Jeff often names them meaningfully), created date, duration
- Check if already processed (track in `memory/music/voice-memo-log.md`)
- Skip duplicates

### Step 3 — Transcribe (or prompt Jeff)

**Cowork can't transcribe audio directly.** Two paths:

**Path A: Use a transcription service** — if Jeff has Whisper locally, or a Zapier integration with Whisper, or Otter.ai, or any of these wired up, use them. Ask once which service he wants and store the pref.

**Path B: Ask Jeff to transcribe key ones** — for memos Jeff wants catalogued deeply, ask him to dictate/summarize each one into chat so Andrea can capture. Fallback for memos where filename alone is enough signal.

**Path C: Title-only cataloguing** — for most voice memos, the FILENAME Jeff gave it is the signal (e.g., "Chorus idea for Long Drive"). Don't transcribe audio; just catalog by title + date.

### Step 4 — Classify each memo

For each:
- Infer song it belongs to (match against master catalog titles)
- Classify as: `fragment` (< 60 sec or just a hum), `sketch` (structured idea), `extension` (adding to existing song)
- Tag theme if obvious from title
- Flag potential duplicates ("this might be the same as 'Long Drive chorus v2' from 3 months ago")

### Step 5 — Write to master catalog

For each processed memo:
- If it matches an existing catalog entry, append the memo link under that song's files
- If it's a new entry, create one at `fragment` status

Log processed memos to `memory/music/voice-memo-log.md`:

```
| Date | Filename | Status | Catalog entry | Notes |
|------|----------|--------|---------------|-------|
```

### Step 6 — Surface the summary

Under 200 words:

```
🎤 **Voice memo ingest — {date}**

Processed {N} new memos.

**New catalog entries:** {N}
- {Title 1} — fragment, likely about {theme inferred from name}
- (repeat)

**Additions to existing songs:** {N}
- {Memo title} → added to {existing song} as sketch extension

**Duplicates / already-processed:** {N} (skipped)

**Worth your attention:**
- {1-3 highlights} — memos where the filename suggests real material

Want me to /song-search any of these to see what else connects? Or move on?
```

## Edge cases

- **Ambiguous filename** ("untitled 2026-03-15") — log as `fragment` with date; flag for Jeff to name later
- **Very old memos** (> 1 year) — still process, but flag as "aged" so Jeff can batch-review
- **Duplicate memos** (Jeff recorded the same chorus 3 times) — detect via similar names, group under one catalog entry

## Rules

- **Never delete the original memo files.** They stay in Drive.
- **Never share memos outside Jeff's private space.** These are often personal/unfinished work.
- **Process in batches.** Running through 100+ memos in one shot is exhausting. Cap at 20 per run; ask to continue.
- **Don't transcribe without permission.** Many memos have personal content Jeff may not want transcribed to a document.

## Memory

- Reads: `memory/music/master-catalog.md`, `memory/music/voice-memo-log.md`, Drive folder
- Writes: `memory/music/master-catalog.md` (append new songs), `memory/music/voice-memo-log.md` (track processed memos)
