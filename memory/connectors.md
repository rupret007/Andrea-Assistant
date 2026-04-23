# Connectors — what Andrea has wired up

Live inventory of external tools Andrea can call. Maintained by `/discover-tool` as new connectors get installed.

## Active

### Gmail (personal)
- What: Jeff's personal inbox. Read threads, search, draft replies, list labels.
- When to use: any personal email work. NEVER work email — not connected, deliberate boundary.
- Tool names: `create_draft`, `search_threads`, `get_thread`, `list_drafts`, etc.

### Google Calendar
- What: Jeff's personal calendar. List events, create, update, delete, find free time.
- When to use: scheduling, meeting prep, morning brief, rehearsal proposals.
- Tool names: `list_events`, `create_event`, `suggest_time`, `find_free_time`, etc.

### Google Drive
- What: Jeff's Drive — Docs, Sheets, Slides, files. Read, search, create.
- When to use: song catalog, lyrics, setlists, Cisco check-in references, anything he stores in Drive.
- Tool names: `search_files`, `read_file_content`, `create_file`, `list_recent_files`, etc.

### Exa (web search)
- What: neural web search with clean content extraction.
- When to use: research, intel briefings, market scans, learning about a topic.
- Tool names: `web_search_exa`, `web_fetch_exa`.

### Zapier MCP
- What: meta-connector exposing 8,000+ apps (Instagram, YouTube, SoundCloud, Twilio, etc).
- When to use: anything Jeff uses that isn't covered by a dedicated MCP.
- Config: https://mcp.zapier.com/mcp/servers/3bdb3807-ff47-439d-9a0a-5be60a589b37/config
- Status: connected, but specific actions need to be exposed at the config URL first.

## Not connected (deliberate boundaries)

- **Cisco work email** — Jeff keeps work separate. Never attempt to wire this.
- **Slack** — Jeff doesn't use it.

## Wish list / would help if added

- **Twilio** — SMS + voice calling (Phase 4 of Calling-Andrea).
- **GitHub** — when first-party ships, `/repo-standup` becomes native instead of WebFetch.
- **Fathom** — bot-less meeting notes.
- **iMessage** (Mac-only via BlueBubbles bridge) — if Jeff wants to stay in his existing messaging.
- **Ableton MCP** — for DAW-level collaboration on music.

## How to add more

Run `/discover-tool {capability}` — Andrea searches the registry, proposes matches, handles install guidance.
