---
name: say-it
description: Convert a block of text into a speak-friendly version ready for text-to-speech playback. Use when Jeff says "say this", "read this out", "voice-ify this", or pastes text he wants ElevenLabs / macOS `say` / iOS Shortcut to read aloud. Strips markdown, shortens sentences, spells numbers, removes URLs.
---

# Say It

On-demand TTS converter. Jeff pastes text — you return a speakable version.

## When to use

- "Say this: {text}"
- "Read this out: {text}"
- "Voice-ify this"
- "Convert to speech"
- Jeff pastes anything he wants piped through TTS

## Process

1. Take the input text as-is.
2. Apply voice-mode rules from `/voice-mode` (see its SKILL.md for the full list).
3. Return the spoken version in a code block (so Jeff can copy it cleanly into TTS).
4. If the original was long, offer a shorter "60-second version" too.

## Output format

```
[Speak version]
{the speakable text}

[Suggested TTS settings]
- Voice: {ElevenLabs voice name recommendation, based on content type}
- Pace: {slower for emotional, normal for informational}
- Approximate length: {N} seconds

[Paste into]
- macOS: open Terminal → `say -f <paste>.txt`
- ElevenLabs: paste into the TTS studio
- iOS: use the "Speak Text" action in Shortcuts
```

## Quick one-liner mode

If Jeff just wants a single-line conversion (no need for the full format), return the speakable version on one line:

Jeff: "Say it: The Wintrust meeting is at 3pm tomorrow."
Andrea: "The Wintrust meeting is at three, tomorrow afternoon."

## Voice recommendations

- **Crisp / informational content** → ElevenLabs "Rachel" or "Bella"
- **Warm / personal** → "Sarah" or a custom Jeff-cloned voice
- **Stage announcement / energetic** → "Adam" or "Clyde"
- **Andrea's own voice (if cloned)** → use that

## Never do

- Never add content Jeff didn't include in the source.
- Never change meaning — only phrasing.
- Never include URLs in the spoken output.

## Memory to read
- `memory/andrea-identity.md`
- `/voice-mode` SKILL.md (for the full rewrite rule set)
