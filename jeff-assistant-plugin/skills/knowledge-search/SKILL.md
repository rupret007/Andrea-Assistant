---
name: knowledge-search
description: Search across Jeff's entire memory + Drive + previously saved research with provenance. Returns where each hit came from and why it matched. Use when Jeff says "find X", "where did I write about Y", "what do I know about Z", "search my notes". Routes between local memory, Drive, and prior research briefs.
---

# Knowledge Search

Ported from Andrea_NanoBot's `KNOWLEDGE_LIBRARY.md` router pattern. Choose the right source and show provenance on every answer.

## Sources (in priority order)

1. **Local memory** (`memory/*`) — CLAUDE.md, identity, people, projects, music, context, life-threads, playbooks
2. **TASKS.md** — current active, waiting, someday, done
3. **Research archive** (`memory/research/` if exists) — saved briefs from `/research-topic`
4. **Outcome log** (`memory/outcome-log.md`) — what actually happened
5. **Message log** (`memory/message-log.md`) — past sends + trust-ladder entries
6. **Google Drive** — via Drive MCP, only when local sources insufficient

## Process

### Step 1 — Understand the query
- Specific entity ("Lucky Ivy", "Wintrust", "Better Than Now") → local memory first
- Date-scoped ("last week's Cisco check-in") → Drive + memory
- Factual ("when did Stalemate release Andrea") → memory/music/ first
- Open-ended ("what do I know about Ham radio contests") → multi-source

### Step 2 — Route
Pick 1–3 sources most likely to have answers. Don't scan everything — that's noise.

### Step 3 — Retrieve
- Memory searches: grep over markdown files
- Drive: `search_files` + `read_file_content` as needed
- Research archive: read brief by topic match

### Step 4 — Return hits with provenance

Format:

```
🔎 **Knowledge search — "{query}"**

**Found {N} hits across {sources}**

### 1. {source label} — {file or doc title}
> "{relevant excerpt, 1–3 lines}"
**Where:** `memory/people/lucky-ivy.md` line 12
**Confidence:** high / medium / low
**Why matched:** {specific term or context}

### 2. {next hit}
...

**What I couldn't find:** {any queries that returned nothing}
```

Always show where the hit came from. That's the Knowledge Library pattern — no black-box answers.

### Step 5 — Offer the next step
- "Want me to /research-topic this more broadly?"
- "Want me to open a /life-thread to track what we find?"
- "Want me to pull the full doc from Drive?"

## Confidence scoring

- **High** — exact phrase match, canonical source (memory/people/ for a person)
- **Medium** — adjacent concept, related source
- **Low** — mentioned in passing, may not be what Jeff meant

Flag low-confidence hits explicitly so Jeff doesn't treat them as authoritative.

## Router examples

Jeff: "What do I know about the Wildflower Festival?"
→ Route: `memory/projects/rad-dad.md`, `memory/music/rad-dad-setlist.md`, Drive search for "Wildflower"

Jeff: "Where did I write about constructiondaily?"
→ Route: `memory/projects/constructiondaily.md`, GitHub repo page (via /repo-standup), Drive search

Jeff: "What was last week's check-in about?"
→ Route: Drive search `title contains 'check-in' modifiedTime > 7 days ago`

Jeff: "Who plays drums in Stalemate?"
→ Route: `memory/projects/stalemate.md` or `memory/people/che.md` — factual, single source sufficient

## Rules

- **Provenance on every hit.** Never return a fact without its source.
- **Don't invent.** If nothing matches, say so.
- **Public Drive only in personal Google.** Never attempt work email content.
- **Respect thread privacy.** Life threads are private — only surface if Jeff explicitly asked for thread content.

## Memory
- Reads: `memory/*`, `TASKS.md`, Drive (via connector)
- Writes: optionally caches expensive research results to `memory/research/{query-kebab}.md`
