---
name: lyric-vault
description: Process a voice memo, rough transcript, or raw song-writing dump into a filed lyric document. Auto-tags by band (Rad Dad / Stalemate / solo), key, tempo, and theme, writes to Jeff's Drive lyric folder structure, and updates the song catalog. Use when Jeff says "I just recorded a song idea", "here's a voice memo of a song", "file this lyric", or drops raw lyrics and wants them saved properly.
---

# Lyric Vault

Turns raw song ideas into filed, searchable lyric documents — the #1 indie-musician AI automation pattern in 2026.

## When to use

Jeff says something like:
- "I recorded a voice note of a song idea"
- "Here's a chorus I came up with"
- "File this lyric"
- "Add this to my song catalog"
- Pastes raw lyrics / voice-memo transcript / stream of ideas

## Process

### Step 1 — Capture the raw material

Accept whatever Jeff gives you:
- Pasted text (lyrics, rough ideas)
- A Drive file path to a voice memo
- A transcript dump

If it's a voice memo file Jeff has in Drive, ask him to use Apple Voice Memos export or a transcription service first (Cowork can't transcribe audio directly). Workaround: he pastes the transcript in manually, or records to Google Recorder which auto-transcribes and saves to Drive.

### Step 2 — Classify

Analyze the content and ask (or infer from context):
1. **Which project?** Rad Dad / Stalemate / Jeff solo / Trailer Swift parody / undecided
2. **Status?** Complete song / chorus-only / verse-only / hook / fragment / rewrite
3. **Key?** Let Jeff fill in if not obvious
4. **Theme / mood?** Love / breakup / nostalgia / party / anthem / quiet / political / comedy / ska
5. **Temp title?** Either Jeff's or propose 3 options

Cross-reference `memory/music/song-catalog.md` and `memory/music/stalemate-songlist.md` — if the theme/title overlaps with an existing song, flag it: "this might build on [existing title] — continue or fresh?"

### Step 3 — Structure the lyrics

If the raw is unstructured prose, propose a structure:
- Verse 1 / Pre-chorus / Chorus / Verse 2 / Bridge / Outro
- Offer 2–3 alternate chorus hooks
- Flag repeated phrases as candidate hooks
- Mark anything that's placeholder (`[TBD]`, `[find rhyme]`)

### Step 4 — File it

Write the structured lyric to a new Google Doc in the appropriate Drive folder:
- Rad Dad originals → inside the Rad Dad Videos / band folder
- Stalemate → inside the Stalemate folder (`1bULWVNZEKdasOU8SAwqq05kJ_6CHtaLo`)
- Jeff solo → root of Drive (same place as "Another Bland Love Song", "Oui C'est Fou", etc.)
- Undecided → general `Lyrics/` folder (`1zg__1dMIpSMLnIi4yFGms59CvDBafcAg`)

Title format: `{Song Title} - Lyrics` or `{Song Title} - {YYYY-MM-DD} sketch`

### Step 5 — Update the catalog

Append an entry to `memory/music/song-catalog.md` with:
- Song title (or temp title)
- Band / project
- Date captured
- Key (if known)
- Link to the new Drive doc
- 1-line theme summary

### Step 6 — Offer follow-ups

After filing, offer:
- "Want to send this to Travis/Che/Lucky for feedback? I can draft the group-text via `/band-comms`."
- "Want me to suggest a chord progression in {key}?"
- "Want me to generate 3 alternate verse ideas?"
- "Want me to check your Stalemate song list for anything that could pair as a B-side?"

## Never do

- Never publish or share the lyric outside Drive without Jeff's explicit approval.
- Never generate finished lyrics from nothing — always work from Jeff's raw material.
- Never delete or overwrite existing lyric docs; always create new.

## Memory to read
- `CLAUDE.md`
- `memory/music/song-catalog.md`
- `memory/music/stalemate-songlist.md`
- `memory/music/rad-dad-setlist.md`
- `memory/projects/jeff-solo-music.md`
