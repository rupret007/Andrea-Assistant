# Research — saved briefs

When `/research-topic` runs, saved briefs land here. Keeps research context retrievable without rerunning Exa every time Jeff asks about a topic again.

## Structure

Filename pattern: `{kebab-topic}-{YYYY-MM-DD}.md`

Examples:
- `apex-ai-status-2026-04-17.md`
- `wpsd-firmware-updates-2026-04-17.md`
- `wintrust-q1-earnings-2026-04-20.md`

## Life cycle

1. `/research-topic` writes a new brief here after synthesis
2. `/knowledge-search` reads this folder when Jeff asks about a topic
3. Nightly consolidation flags briefs older than 60 days for archive
4. Archived briefs move to `memory/archive/research/`

## Rules

- Don't silently overwrite existing briefs — append an updated version with today's date
- When a topic is revisited, note both the old brief and the new one and flag anything that changed
- Cite every factual claim with a source URL
