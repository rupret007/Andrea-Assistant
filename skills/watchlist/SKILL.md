---
name: watchlist
description: Maintain persistent topics Jeff wants monitored continuously — customers, technologies, competitors, bands, keywords. Adds, lists, removes, or scans watchlist items. When run as a scheduled task, surfaces only new changes since last check so Jeff never misses something important. Use when Jeff says "watch {topic}", "add {X} to watchlist", "what's new on my watchlist", or "stop watching {X}".
---

# Watchlist

Persistent topic monitoring powered by Exa. Unlike `/intel-brief` which scans a standard set of areas, `/watchlist` tracks whatever Jeff adds — and only surfaces deltas since last check.

## Storage

Watchlist items live in a single Markdown file:
`memory/watchlist.md`

Format:
```markdown
# Watchlist

## Active

### {topic name}
- Query: "{natural language search query}"
- Why watching: {1-line reason}
- Added: {YYYY-MM-DD}
- Last checked: {YYYY-MM-DD}
- Seen URLs:
  - {url1}
  - {url2}

(repeat per topic)

## Paused / removed
(historical log)
```

## Commands

### Add a topic
User: "Watch {topic}" / "Add {X} to watchlist"
- Ask Jeff for:
  - A good natural-language query (propose one; let him edit)
  - Why he's watching it (1 line)
- Create an entry in `memory/watchlist.md` with today's date, empty `Seen URLs`.
- Confirm: "Watching {topic}. I'll surface new results in the next scan."

### List all
User: "What's on my watchlist"
- Read `memory/watchlist.md` → show the Active section cleanly
- Include "last checked" ages

### Remove / pause
User: "Stop watching {X}" / "Remove {X}"
- Move that entry from Active to Paused. Don't delete — keep the history.
- Confirm.

### Scan (the main job)
User: "What's new on my watchlist" / "Scan watchlist"  (or scheduled task)

For each Active topic:
1. Run `web_search_exa` with the stored query, numResults: 10
2. Compare each result URL against the topic's `Seen URLs` list
3. New URLs → flag as new signal
4. Old URLs → skip
5. For each new URL: 1-line summary from Exa highlights

Update the topic's `Last checked` date and append new URLs to `Seen URLs`.

### Output

Format (under 400 words total across all topics):

```
👁 **Watchlist — {N} active topics — {date}**

## {topic name} ({N} new)
- **{headline}** — {1-line summary}  [source]({url})
- (repeat per new result)

## {next topic} ({N} new)
- (same)

(topics with zero new signal are omitted — no filler)

## Summary
- {1 line — "quiet week overall" / "big news on X" / "consider action on Y"}
```

## Suggested starter topics for Jeff

When Jeff first uses `/watchlist`, propose these starter entries and let him cherry-pick:

- "Webex Calling Hybrid adoption, pricing, and enterprise wins"
- "Cisco UCM 15 field issues and customer reactions"
- "Wintrust Financial earnings and technology investments"
- "Farmers Insurance technology partnerships and digital initiatives"
- "WPSD DMR hotspot firmware updates and BrandMeister network changes"
- "Rad Dad band similar-genre indie releases" (for setlist inspiration)
- "Stalemate release plays, reviews, or blog mentions"
- "Ham radio AI / agentic automations for operators"
- "Construction company tech adoption (for Lucky's concrete-company ops tool)"

## Never do

- Never add a topic silently — always confirm the query and reason with Jeff.
- Never report the same URL twice across scans.
- Never drop the Seen URLs history — it's the whole point.
- Never include work email content. Exa public-web only.

## Memory to read
- `memory/watchlist.md` (source of truth)
- `CLAUDE.md`
- `memory/context/company.md`
