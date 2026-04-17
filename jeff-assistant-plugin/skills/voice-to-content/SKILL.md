---
name: voice-to-content
description: Turn a voice memo, stream-of-consciousness thought, or rough transcript into finished output — a social post, blog draft, LinkedIn post, email, song lyric sketch, show announcement, or band group-text. Use when Jeff says "I just recorded a voice note", pastes a transcript, or dumps raw thoughts and wants something polished out the other end. Draft-only — Jeff approves before anything is posted or sent.
---

# Voice to Content

## When to use

Jeff just said something like:
- "I recorded a voice memo — turn it into a LinkedIn post"
- "Here's a rough transcript, make a blog post"
- "Take this and turn it into a show announcement"
- "Make a song lyric draft from this"
- "Write a social post about X"
- Or pastes raw thoughts / bullet points / a rant / an idea dump

## Core principle

Jeff provides the raw material. You provide the finished artifact. **You do NOT post, send, or publish anything.** Jeff reviews and distributes himself.

## Process

### Step 1 — Identify the target format
Ask Jeff if not already clear:
1. What platform / format? (LinkedIn post, blog, tweet thread, band group-text, show announcement, song lyric, email draft, journal entry, newsletter)
2. Who's the audience? (professional network, Rad Dad fans, bandmates, family, strangers on the internet)
3. Length target? (280 chars, 400 words, full blog, 2-minute read)
4. Tone? (casual / professional / hype / reflective)

### Step 2 — Read Jeff's memory to match his voice
Before drafting, read:
- `CLAUDE.md` — for his overall voice, role, projects
- `memory/projects/` — if the content touches Rad Dad, Stalemate, Cisco work, coding projects, solo music
- `memory/music/` — if it's songwriting or music-promo content

### Step 3 — Draft

Match Jeff's voice from the memory files. General rules:
- **Lead with the hook.** Don't bury the point.
- **Short sentences beat long ones.**
- **Specific > abstract.** Name the song, the city, the customer, the date.
- **No corporate filler.** "Circling back" or "touching base" is banned.
- **First-person where natural.**
- **No emojis** unless the target is band/fan content, where they're fine in moderation.

### Step 4 — Offer variants

After the primary draft, offer:
- A shorter version
- A more casual or more professional variant
- A different opening hook

### Step 5 — Return cleanly

Deliver the draft in a code-fenced block so Jeff can copy-paste. Call out anything you guessed or extrapolated that he should verify.

## Special modes

### Song lyric sketch
When the target is a song lyric draft:
- Preserve the emotional core of what Jeff said, don't sanitize it
- Propose a structure (verse / chorus / bridge)
- Suggest 2–3 alternate chorus hooks
- Flag if a similar title/theme exists in his existing catalog (cross-reference `memory/music/song-catalog.md` and `stalemate-songlist.md`)

### Show announcement
When the target is a Rad Dad gig announcement:
- Include: date, venue, set time if known, lineup, website raddadband.com
- Offer short (Instagram caption) and long (Facebook event description) versions
- Do NOT reference streaming releases since Rad Dad has no streaming releases yet — but Jeff's solo + Stalemate do

### Cisco-adjacent content
If the raw material is work-flavored, **draft only at the generic level**. Do not include customer names (Farmers, Wintrust) or TAC case details unless Jeff explicitly paste them in, because work email is NOT connected to this assistant and we should not model internal Cisco info.

## Never do

- Never post, send, or publish on Jeff's behalf.
- Never invent facts (show dates, statistics, customer details) not in the raw material.
- Never cross customer/work content into public output.

## Memory to read
- `CLAUDE.md`
- `memory/projects/` (as relevant)
- `memory/music/song-catalog.md` (for lyric work)
