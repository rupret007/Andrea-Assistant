# Andrea

**Jeff Story's personal AI assistant.** Named after the 1998 Stalemate single.

Built on Claude Cowork with **37 custom skills, 18 scheduled rituals, three-tier memory, Trust Ladder autonomy, Life Threads, Action Bundles, Outcome Tracking, Exa-powered intel, and a Conductor pattern** that orchestrates specialist sub-agents and learns new skills when she hits gaps.

Successor to [Andrea_NanoBot](https://github.com/rupret007/Andrea_NanoBot) — now on a maintained platform instead of a one-person-maintained stack.

---

## Quick install on a fresh Mac

```bash
git clone https://github.com/rupret007/Andrea-Assistant.git ~/Andrea
cd ~/Andrea
bash setup.sh
```

Then restart the Claude desktop app. Open Cowork → new task → type `/andrea`. She'll greet you.

---

## The open dashboard

Double-click **`andrea-dashboard.html`** for a visual overview — every skill, every ritual, every life thread, every connector.

---

## What she does

### 37 skills, organized by domain

- **Identity & voice** — `/andrea` `/voice-mode` `/say-it`
- **Conductor & growth** — `/conductor` `/self-assess` `/learn-skill` `/discover-tool`
- **Communication** — `/band-comms` `/rehearsal-proposal` `/release-day` `/inbox-triage` `/voice-to-content` `/ghostwriter`
- **Work (Cisco)** — `/cisco-check-in-draft` `/meeting-prep`
- **Music & creative** — `/songwriter` `/lyric-vault` `/market-scan`
- **Coding / projects** — `/repo-standup` `/wpsd-health`
- **Intelligence** — `/intel-brief` `/watchlist` `/research-topic` `/what-changed` `/knowledge-search`
- **Planning** — `/chief-of-staff` `/mission` `/focus-sprint` `/mode-switch`
- **Trust & autonomy** — `/trust-ladder` `/delegation-rules` `/action-bundle` `/outcome-log`
- **Memory & thought** — `/life-thread` `/idea-capture` `/decision-log` `/andrea-pulse`

### 18 scheduled rituals

Morning briefing (Mon–Fri 6:58am), pre-meeting auto-brief (every 30 min weekday workhours), midday reground (12:33), end-of-day wrap (3:51), Wednesday mid-week scan, Thursday check-in nag, Friday Utilization Report reminder, Saturday creative block nudge, Saturday overnight research (Pulse-style async brief), Sunday week-ahead preview, Sunday repo standup, nightly evening reset (9pm), nightly memory consolidation (11pm), monthly review, monthly reconnect nudge, Wildflower show countdowns (T-7 / T-3 / T-1).

### Active life threads

- Lucky Ivy's concrete company (ongoing with brother Chris on constructiondaily)
- Richardson Wildflower Festival 2026 (Rad Dad show arc)
- Stalemate return (paused for Sean's paternity leave)
- Andrea's own evolution (meta-thread)

### Connected tools

- Gmail (personal) · Google Calendar · Google Drive · Exa (web search) · Zapier (8k+ apps)

**Deliberately NOT connected:** work email (Cisco stays separate).

---

## Architecture in one diagram

```
┌─────────────────────────────────────────────────────┐
│                    JEFF'S MAC                       │
│                                                     │
│  ┌───────────────┐    ┌──────────────────────┐      │
│  │    Cowork     │───▶│   ~/.claude/skills/  │      │
│  │   (desktop)   │    │    (37 skills)       │      │
│  └──────┬────────┘    └──────────────────────┘      │
│         │             ┌──────────────────────┐      │
│         ├────────────▶│ ~/.claude/projects/  │      │
│         │             │   andrea/memory/     │      │
│         │             └──────────────────────┘      │
│         │             ┌──────────────────────┐      │
│         └────────────▶│  Scheduled tasks     │      │
│                       │  (18 rituals)        │      │
│                       └──────────────────────┘      │
└─────────┬───────────────────────────────────────────┘
          │
          ▼
┌─────────────────────────────────────────────────────┐
│                     CLOUD                           │
│                                                     │
│  Anthropic Claude ─── Gmail ─── Calendar ─── Drive  │
│                                                     │
│  Exa ─── Zapier (8000+ apps) ─── [future] Twilio    │
└─────────────────────────────────────────────────────┘
          │
          ▼
┌─────────────────────────────────────────────────────┐
│                     JEFF'S PHONE                    │
│                                                     │
│     Claude iOS app ─── Siri Shortcut (Ask Andrea)   │
└─────────────────────────────────────────────────────┘
```

---

## Documents worth reading

- **[First Week With Andrea](./First-Week-With-Andrea.docx)** — day-by-day plan for week 1
- **[Build Plan](./All-Around-AI-Assistant-Build-Plan.docx)** — the north-star roadmap
- **[Always-On Setup Guide](./Always-On-Setup-Guide.docx)** — 5-phase walkthrough to 24/7
- **[Calling Andrea](./Calling-Andrea.docx)** — 5-phase walkthrough to voice + phone
- **[Andrea v3 Status](./Andrea-v3-Status.docx)** — comprehensive state report

---

## Using Andrea daily

Three ways:

1. **She comes to you** — 18 rituals fire on schedule. Morning briefing at 6:58, EOD wrap at 3:51, weekly rituals every week.
2. **You come to her** — open Cowork → new task → type any slash command (`/andrea` `/chief-of-staff` `/what-changed` `/meeting-prep` — all 37 skills).
3. **Phone** — iOS Shortcut wired to the Claude app (set up in Calling-Andrea guide). *"Hey Siri, [your trigger]"* → voice conversation.

Over time, use `/idea-capture` `/decision-log` `/life-thread` to feed her more. The nightly 11pm consolidation merges duplicates and flags contradictions. She gets smarter.

---

## Design principles

1. **Draft-first always.** Never sends without approval unless Jeff set an explicit per-class rule.
2. **Match Jeff's voice.** Not corporate. Short sentences. Contractions. No sycophancy.
3. **Public sources only.** Work email deliberately not connected.
4. **Everything logged.** Memory CHANGELOG + Outcome Log + Message Log make it auditable.
5. **Graceful degradation.** If a connector fails, she says so — doesn't fake it.
6. **Grows on demand.** When she hits a gap, `/learn-skill` drafts a new skill with your review.

---

## Repo structure

```
.
├── CLAUDE.md                     # Working memory (Andrea's brain file)
├── TASKS.md                      # Task list
├── andrea-dashboard.html         # Visual overview — open in a browser
├── dashboard.html                # Task-focused dashboard
├── setup.sh                      # One-command bootstrap on a new Mac
├── memory/                       # Full memory system
│   ├── andrea-identity.md        # Her persona, voice, boundaries
│   ├── INDEX.md                  # Live entity index
│   ├── CHANGELOG.md              # Append-only memory log
│   ├── delegation-rules.md       # Per-class autonomy
│   ├── connectors.md             # Active tool inventory
│   ├── glossary.md
│   ├── people/                   # Chris, Lucky, Travis, Che, Sean
│   ├── projects/                 # Rad Dad, Stalemate, WebJam, etc.
│   ├── music/                    # Setlists, discography, catalogs
│   ├── context/                  # Cisco / work context
│   ├── life-threads/             # Lucky, Wildflower, Stalemate, Andrea
│   ├── library/                  # Drafts, research, creative sparks
│   ├── research/                 # Saved research briefs
│   ├── episodes/                 # Time-stamped what-happened log
│   └── playbooks/                # Procedural "how Jeff likes it"
├── skills/                       # 37 SKILL.md files — the whole library
├── jeff-assistant-plugin/        # Installable plugin bundle
│   ├── .claude-plugin/plugin.json
│   ├── andrea-identity.md
│   ├── README.md
│   └── skills/
├── .claude-plugin/marketplace.json  # Plugin marketplace definition
└── *.docx                        # Build plan + setup guides
```

---

## Credits

- Name origin: the 1998 Stalemate single *Andrea*
- Pattern origins: [Andrea_NanoBot](https://github.com/rupret007/Andrea_NanoBot) — Trust Ladder, Action Bundles, Life Threads, Chief-of-Staff 9-signal model, Knowledge Library router, Delegation Rules
- Platform: [Claude Cowork](https://claude.com/product/cowork) + [Claude Agent SDK](https://platform.claude.com/docs/en/agent-sdk/overview)
- Research tooling: Exa web search (neural + content extraction)

---

## License

Personal use, Jeff Story only. Don't redistribute without permission. Fork for your own assistant if inspired.

*— Andrea, v4.0, April 2026*
