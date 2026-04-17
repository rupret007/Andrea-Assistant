# Jeff Assistant Plugin

Every custom skill built around Jeff Story's life — Cisco service management, bands (Rad Dad + Stalemate), solo music, coding side-projects, and Ham radio.

## Included skills

| Skill | What it does |
|-------|-------------|
| `/band-comms` | Draft group messages for Rad Dad or Stalemate |
| `/chief-of-staff` | Cross-source scan — 9 signal types that need attention |
| `/cisco-check-in-draft` | Draft this week's Cisco check-in from Drive pattern |
| `/focus-sprint` | Timed deep-work block with context load + wrap |
| `/inbox-triage` | Sort personal Gmail into act/later/archive/delete |
| `/lyric-vault` | File a voice memo or lyric into the song catalog |
| `/meeting-prep` | Pre-brief for next calendar meeting |
| `/mission` | Break a big goal into phased plan |
| `/mode-switch` | Load context for Rad Dad / Cisco / WebJam / etc. |
| `/rehearsal-proposal` | Propose band practice times + draft group-text |
| `/release-day` | Coordinate a music release across platforms |
| `/repo-standup` | Weekly standup across Jeff's GitHub repos |
| `/research-topic` | Multi-agent deep research orchestrator |
| `/songwriter` | Co-writing partner — lyrics, chords, structure |
| `/voice-to-content` | Turn voice notes into finished posts / emails / lyrics |
| `/what-changed` | Recent activity delta across Drive + Gmail + Calendar |
| `/wpsd-health` | Check the Ham radio DMR hotspot |

## Install

### Option A — Cowork plugin install
Place the `jeff-assistant-plugin/` folder inside a Claude plugin marketplace you control, or copy it to `~/.claude/plugins/`.

### Option B — Direct skill install (simplest)
Copy the `skills/` folder contents directly into `~/.claude/skills/`:

```bash
cp -r jeff-assistant-plugin/skills/* ~/.claude/skills/
```

After either option, the skills appear in Cowork's `/` slash-command list.

## Memory files required

These skills assume memory files exist at `./memory/`:

- `CLAUDE.md` — working memory
- `memory/people/` — Chris Story, Lucky Ivy, Travis Worsham, Che, Sean
- `memory/projects/` — rad-dad, stalemate, jeff-solo-music, webjam, constructiondaily, wpsd-dashboard, andrea
- `memory/music/` — song-catalog, rad-dad-setlist, stalemate-songlist, discography

If you're deploying this fresh on a new machine, copy the `memory/` folder too.

## Companion scheduled tasks

These skills pair with 13 scheduled tasks that run on cadence:

- Weekday morning briefing (7am)
- Weekday end-of-day wrap (4:30pm)
- Pre-meeting auto-brief (every 30 min, work hours)
- Sunday week-ahead preview (6pm)
- Sunday repo standup (8pm)
- Thursday check-in deadline nag (noon)
- Friday utilization-report reminder (9am)
- Saturday creative block nudge (10am)
- Monthly review (1st of month, 9am)
- Monthly reconnect nudge (1st Sunday, 11am)
- Wildflower show countdowns (T-7, T-3, T-1)

Scheduled tasks live in Cowork's sidebar, not in this plugin. They're wired to the same memory files.

## License

Personal use, Jeff Story only. Don't redistribute without permission.
