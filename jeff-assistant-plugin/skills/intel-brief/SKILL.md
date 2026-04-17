---
name: intel-brief
description: Produce a personalized intelligence briefing using Exa web search — news, signals, and context across Jeff's accounts (Wintrust, Farmers), his product area (Cisco Webex Collaboration, UCM, Contact Center), his bands, and his other interests (Ham radio / DMR / WPSD). Use when Jeff says "what's new in my world", "intel brief", "before my Wintrust review", "anything new with Cisco Collab", or when prepping for a customer meeting. Does NOT touch Cisco work email — this is public intel only.
---

# Intel Brief

Exa-powered personal news assistant. Filters public signal across Jeff's interests.

## Standard intel areas

Run searches across these by default (Jeff can narrow or expand):

1. **Cisco Collaboration product line** — Webex, UCM, Contact Center, Webex Calling, Webex Calling Hybrid, announcements, releases, roadmap
2. **Wintrust** — press releases, earnings, leadership changes, tech spend signals
3. **Farmers Insurance** — press releases, tech partnerships, adoption signals
4. **Ham radio / WPSD / DMR** — updates, firmware changes, outages, network changes
5. **Music industry (when relevant)** — Apple Music / Spotify algorithm updates, indie release best practices, playlist-pitching trends

## When to use

- "Intel brief"
- "What's new in my world"
- "Any news on {Wintrust / Farmers / Cisco / Webex / Ham radio}"
- "Prep me before my {customer} call"
- Running as a scheduled ritual (daily dawn brief)

## Process

### Step 1 — Scope

If Jeff named specific topics, run only those. Otherwise default to the 5 standard areas.

Ask (in one message if ambiguous): "Full intel sweep or zoom to {topic}?"

### Step 2 — Run Exa searches

Use `mcp__f83b83a3-af61-4b95-9334-92e3f5b16517__web_search_exa` for each topic. Write queries as natural-language descriptions of the ideal page, not keyword strings. Examples:

- `"Cisco Webex Collaboration product announcements April 2026 for enterprise customers"`
- `"Wintrust Financial news leadership change earnings {current month 2026}"`
- `"WPSD DMR hotspot release notes firmware update 2026"`

Prefer `numResults: 5` per topic. Filter results to content published in the last 30 days when possible.

### Step 3 — Deep-fetch the best sources

For the most promising 2–3 results per topic, use `web_fetch_exa` to pull the full content. Keep `maxCharacters: 3000` or less per URL to stay efficient.

### Step 4 — Produce the brief

Format (under 500 words):

```
🌐 **Intel Brief — {date}**

## Cisco Collaboration
- **{headline}** ({date}) — {1-2 sentences of why it matters to Jeff / Farmers / Wintrust}
  [source]({URL})

## Wintrust
- (same format)

## Farmers
- (same format)

## Ham radio / WPSD
- (same format)

## Signal summary
- {1-2 sentence "so what" for Jeff's actual decisions this week}
- {Anything actionable — "Wintrust Q1 earnings Monday, worth mentioning in your review"}
```

### Step 5 — Offer follow-ups

- "Want me to save this brief to Drive as a PDF for reference?"
- "Want me to draft talking points for your {upcoming meeting}?"
- "Want me to set a watch on this topic via /watchlist?"

## Quality rules

- **Cite every claim** with the source URL inline.
- **Flag staleness** — if a search returns only content older than 30 days, say so explicitly.
- **Only public info** — never infer or invent internal Cisco / Wintrust / Farmers details.
- **Zero slop** — no generic "stay informed" filler. Every bullet earns its place.

## Never do

- Never access work email (not connected — explicitly).
- Never claim inside knowledge of customer systems, contracts, or people.
- Never publish or forward the brief without Jeff's approval.

## Memory to read
- `CLAUDE.md`
- `memory/context/company.md`
- `memory/projects/wpsd-dashboard.md`
