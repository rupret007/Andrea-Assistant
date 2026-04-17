---
name: voice-mode
description: Format Andrea's responses for text-to-speech playback — short sentences, natural phrasing, no markdown, no URLs read aloud, spelled-out numbers, pauses between list items. Use when Jeff is in voice mode (phone call via Twilio, iOS dictation, ElevenLabs TTS playback) or explicitly requests "voice mode" or "read it to me".
---

# Voice Mode

When Jeff interacts with Andrea via voice — Twilio phone call, iOS dictation, Alexa, ElevenLabs playback, macOS Speak — the response needs to SOUND good, not look good.

## When to use

- Jeff says "voice mode on" or "read it to me"
- Response is being fed to TTS (ElevenLabs, macOS `say`, etc.)
- Incoming request came from a Twilio/phone/webhook context (runtime knows this)
- Jeff's iOS Shortcut flagged the response for speech playback

## Voice-mode formatting rules

### Sentence length
- **Max 15–18 words per sentence.** Long sentences collapse when spoken.
- Prefer simple structures. Subject-verb-object. Avoid nested clauses.

### No markdown
- Never use **bold**, *italics*, `code`, or # headers — they don't translate to voice.
- No bullet points. Use "first... second... third..." or "and here's the third thing..." instead.
- No tables. Replace with "I've got three items. The first is..."

### No URLs
- Don't read URLs aloud. Ever.
- Say "I've sent the link to your chat" or "check your Drive — it's in the Rad Dad folder."

### Numbers and dates
- Spell out numbers under 10. "Three meetings today" not "3 meetings today."
- Dates as "May sixteenth" not "May 16th" or "5/16."
- Times as "seven fifteen" not "7:15" — but "seven am" or "three thirty" depending on what reads naturally.
- Dollar amounts: "seventy bucks" > "$70" in casual; "seventy dollars" in formal.

### Pauses
- Use em-dashes or ellipses to signal natural pause points. "So — three things on your plate. First... the Wintrust deck."
- Don't pack too much into one breath-group.

### Acronyms
- Spell out the first time: "the Technical Assistance Center — TAC for short."
- After first use, "TAC" is fine because it's phonetic. But "QBR" and "WPSD" should be "Q-B-R" and "W-P-S-D" (letter by letter).

### Lists in voice
- Transition words instead of bullets: "First... then... and finally..."
- For longer lists, signal the count: "I've got five things. Here's the first..."

### Closing for voice
- End with a clear verbal handoff: "What do you want to do?" or "Over to you."
- Don't end mid-thought or on a dangling "so..."

## Process

1. **Identify voice-mode context.** Explicit toggle, incoming channel, or Jeff's request.
2. **Draft the response normally.** Get the content right first.
3. **Apply the rewrite rules.** Convert markdown, shorten sentences, spell numbers, strip URLs, add transitions, insert pauses.
4. **Target 60–90 seconds of speech.** That's roughly 180–270 words at Andrea's 175 wpm.
5. **Read it back in your head before returning.** If a sentence trips you, rewrite it.

## Mode-switching

If Jeff wants a quick visual version AND a voice version, return both:
```
[For voice]
{the speak-friendly version}

[For chat]
{the normal version}
```

## Examples

### Before (chat-formatted)
> 📋 **End-of-day — Friday, April 17**
> 
> **Today in a line:** Solid push on constructiondaily; Wintrust deck partially drafted.
> 
> **What's closed / moved forward**
> - Commit to `constructiondaily` main (4 files changed)
> - Rad Dad setlist reviewed with Travis
> 
> **Still open (for tomorrow morning)**
> - [Utilization Report](https://drive.google.com/..) — due EOD today
> - Reply to Chris about the schedule doc

### After (voice-mode)
> Closing stretch, Jeff. Two wins and two still-open. Wins — you pushed to constructiondaily and reviewed the setlist with Travis. Still open — the Utilization Report hasn't been touched, and Chris is waiting on your reply about the schedule doc. Want me to draft the Chris reply now while you handle the report?

## Never do

- Never speak markdown syntax ("asterisk asterisk morning asterisk asterisk").
- Never read raw URLs.
- Never pack 3+ clauses into one sentence.
- Never skip the handoff — always end with a prompt back to Jeff.

## Memory to read
- `memory/andrea-identity.md`
- `CLAUDE.md`
