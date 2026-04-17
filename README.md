# Andrea

**Jeff Story's personal assistant.** Named after the 1998 Stalemate single. Built on Claude Cowork with 33 custom skills, 18 scheduled rituals, three-tier memory, Trust Ladder autonomy, Life Threads, Action Bundles, Outcome Tracking, Exa-powered intel, and a documented path to voice + phone calling.

Successor to [Andrea_NanoBot](https://github.com/rupret007/Andrea_NanoBot) — now built on a maintained platform instead of a one-person-maintained stack.

---

## What this repo contains

```
.
├── CLAUDE.md                    # Working memory (Andrea's "brain file")
├── TASKS.md                     # Active task list (shared with dashboard)
├── dashboard.html               # Visual view of tasks + memory
├── memory/                      # Full memory system
│   ├── andrea-identity.md       # Her persona, voice, rules
│   ├── INDEX.md                 # Live index of every entity
│   ├── CHANGELOG.md             # Append-only memory change log
│   ├── delegation-rules.md      # Per-class Trust Ladder rules
│   ├── people/                  # Chris, Lucky, Travis, Che, Sean
│   ├── projects/                # Rad Dad, Stalemate, WebJam, etc.
│   ├── music/                   # Setlists, discography, song catalog
│   ├── context/                 # Cisco work context
│   └── life-threads/            # Persistent ongoing matters
├── jeff-assistant-plugin/       # Installable plugin bundle
│   ├── .claude-plugin/
│   │   └── plugin.json          # Plugin manifest
│   ├── README.md
│   ├── andrea-identity.md       # Copy for plugin distribution
│   └── skills/                  # All 33 SKILL.md files
└── *.docx                       # Build plan + setup guides
```

---

## Quick start (on a new machine)

```bash
git clone https://github.com/rupret007/andrea.git
cd andrea

# Install the skills
cp -r jeff-assistant-plugin/skills/* ~/.claude/skills/

# Install the memory
mkdir -p ~/.claude/projects/andrea
cp CLAUDE.md TASKS.md dashboard.html ~/.claude/projects/andrea/
cp -r memory ~/.claude/projects/andrea/

# Open Cowork — Andrea's 33 skills are now available via /
```

Then:
1. Connect Gmail, Google Calendar, Google Drive, Zapier, Exa in Cowork's connector library.
2. Import the scheduled tasks (listed in `Andrea-v3-Status.docx`) — Cowork's `/schedule` skill takes the prompt body from each and creates the cron task.
3. Click "Run now" on `morning-briefing` once to pre-approve permissions.

---

## The 33 skills

**Identity & voice:** `/andrea` `/voice-mode` `/say-it`

**Communication:** `/band-comms` `/rehearsal-proposal` `/release-day` `/inbox-triage` `/voice-to-content` `/ghostwriter`

**Work / Cisco:** `/cisco-check-in-draft` `/meeting-prep`

**Music & creative:** `/songwriter` `/lyric-vault` `/market-scan`

**Coding / projects:** `/repo-standup` `/wpsd-health`

**Intelligence:** `/intel-brief` `/watchlist` `/research-topic` `/what-changed` `/knowledge-search`

**Planning:** `/chief-of-staff` `/mission` `/focus-sprint` `/mode-switch`

**Trust & autonomy:** `/trust-ladder` `/delegation-rules` `/action-bundle` `/outcome-log`

**Memory & thought:** `/life-thread` `/idea-capture` `/decision-log` `/andrea-pulse`

---

## The 18 scheduled rituals

| When | Ritual |
|------|--------|
| Weekdays 6:58am | Morning briefing + Exa dawn intel |
| Weekdays every 30 min (7am–4pm) | Pre-meeting auto-brief |
| Weekdays 12:33pm | Midday reground |
| Weekdays 3:51pm | End-of-day wrap |
| Wednesday 1:06pm | Mid-week chief-of-staff scan |
| Thursday noon | Cisco check-in deadline nag |
| Friday 9:09am | Utilization Report reminder |
| Saturday 10:01am | Creative block nudge |
| Saturday 11:03pm | Weekly deep research brief |
| Sunday 6:07pm | Week-ahead preview |
| Sunday 8:10pm | Repo standup across 6 projects |
| Every day 9pm | Evening reset |
| Every day 11:01pm | Nightly memory consolidation |
| 1st of month 9am | Monthly review |
| 1st Sunday of month 11am | Reconnect nudge |
| May 9 / 13 / 15 | Wildflower show countdowns (T-7, T-3, T-1) |

---

## Guides

- **[Build Plan](./All-Around-AI-Assistant-Build-Plan.docx)** — north-star roadmap for what Andrea is becoming
- **[Always-On Setup Guide](./Always-On-Setup-Guide.docx)** — 5-phase walkthrough to 24/7 operation (cloud Routines + Twilio)
- **[Calling Andrea](./Calling-Andrea.docx)** — 5-phase walkthrough to voice + phone calling
- **[Andrea v3 Status](./Andrea-v3-Status.docx)** — current state, Andrea_NanoBot parity, Apex AI comparison, next moves

---

## Architecture

- **Runtime:** Claude Cowork (desktop) + Claude Code Routines (cloud, for 24/7)
- **Memory:** Three-tier — working (CLAUDE.md), semantic (memory/people, projects, music, context), procedural (memory/playbooks — grows from corrections)
- **Trust:** Six-tier Trust Ladder with per-class delegation rules. Draft-only default. High-risk categories categorically blocked.
- **Observability:** Memory CHANGELOG + Outcome Log + Message Log — everything Andrea does is inspectable.
- **Connectors:** Gmail, Calendar, Drive, Zapier (8k+ apps), Exa (web search). Voice via Twilio ConversationRelay when wired.

---

## Design principles

1. **Draft-first always.** Andrea never sends without approval unless Jeff has explicitly set a per-class rule.
2. **Match Jeff's voice.** Not corporate. Short sentences. Contractions. No sycophancy.
3. **Public sources only.** Work email deliberately not connected.
4. **Every action logged.** Memory CHANGELOG + Outcome Log make everything auditable.
5. **Graceful degradation.** If a connector fails, Andrea says so — doesn't fake it.

---

## Credits

- Andrea's name: the 1998 Stalemate single.
- Pattern origins: [Andrea_NanoBot](https://github.com/rupret007/Andrea_NanoBot) — Jeff's earlier TypeScript implementation. Trust Ladder, Action Bundles, Life Threads, Chief-of-Staff 9-signal model, Knowledge Library router, Delegation Rules — all ported from there.
- Platform: [Claude Cowork](https://claude.com/product/cowork) and [Claude Agent SDK](https://platform.claude.com/docs/en/agent-sdk/overview).

---

## License

Personal use, Jeff Story only. Don't redistribute without permission. Fork for your own assistant if it inspires you.
