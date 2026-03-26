# Demo Script — AI Tinkerers Calgary, March 26, 2026

## Pre-Show Checklist (10 min before)

- [ ] Presentation open: https://QuentinAd.github.io/ait-claw-preso
- [ ] iPhone charged, connected for iPhone Mirroring
- [ ] MacServe PWA open on iPhone home screen
- [ ] Kitchen App PWA open on iPhone home screen
- [ ] Telegram open on iPhone (Andy chat visible)
- [ ] Termius connected via Tailscale
- [ ] Terminal ready at `~/Repos/personal/nanoclaw`

### Backup: serve locally

```bash
cd ~/Repos/personal/ait-claw-preso
python3 -m http.server 8000
```

### Speaker notes: press `S` in the browser

---

## Slide-by-Slide (13 slides, ~15 min)

### 1. Title (30s)
- "I'm Quentin Adam, AI/Data Engineer at Dakota Analytics."
- "Tonight: always-on AI agents — from personal infra to professional applications."

### 2. The Crab Revolution (1 min)
- Claude Code crab mascot → community adopted it → OpenClaw → NanoClaw
- "Things got out of claw" — light pun
- "How much code do you actually need?"

### 3. OpenClaw vs NanoClaw (1.5 min)
- Walk the side-by-side comparison
- Hit the security points: CVE, 12% malicious skills
- NanoClaw philosophy: "Don't add features. Add skills."
- `/add-telegram` transforms your fork, core stays tiny

### 4. Harness Engineering (1 min)
- "2025 was agents. 2026 is agent harnesses."
- The model is not the hard part. The harness is.
- Karpathy: 20 agents in parallel, hasn't written code since December
- Context engineering: right context + right tools + right time

### 5. Architecture Diagram (1.5 min)
- Walk the SVG: host process → messaging → routing → security
- Container per group: isolated Linux VM
- **Key point:** containers are EPHEMERAL — spawned per message, --rm after
- Docker partnership for cross-platform (Apple Container on macOS, Docker on Linux)

### 6. Security + Code (1 min)
- Comparison table — hit isolation, credentials, auditability
- Show the actual container-runner.ts code
- "Mount allowlist lives OUTSIDE the project — containers can't modify their own security"

### 7. LIVE: Meet Andy (2 min)

**Terminal commands (hover for hints in slides):**
```bash
# Check service is running (should show PID)
launchctl list | grep com.nanoclaw

# Watch live logs — look for "Spawning container agent"
tail -30 ~/Repos/personal/nanoclaw/logs/nanoclaw.log

# Show registered groups (main, adam-family, telegram-news)
python3 -m json.tool ~/Repos/personal/nanoclaw/data/registered_groups.json

# Show active sessions (conversation continuity)
python3 -m json.tool ~/Repos/personal/nanoclaw/data/sessions.json
```

**Telegram demo:**
- Send a message to Andy in Telegram
- Watch logs for container spawn → completion
- Show the response

### 8. Always-On Stack (1 min)
- Three services diagram: nanoclaw, macserve, kitchen
- "Zero cloud bills. The Mac IS the server."
- Tailscale mesh: zero-trust, no port forwarding

### 9. LIVE: iPhone Command Center (1.5 min)

**iPhone Mirroring sequence:**
1. **MacServe PWA** — show live dashboard metrics
2. **Kitchen App** — show shopping list
3. **Telegram** — show alert history, recent Andy reply
4. **Termius** — quick SSH: `uptime` or `launchctl list | grep com`

Say: "PWAs on my home screen. No app store. Just hostname:port over Tailscale."

### 10. MCP Bridge (1 min)
- Show kitchen-mcp code — 19 tools
- Walk the conversation example
- "One Telegram message → 5 MCP tool calls → meal planned"

### 11. Autonomy Spectrum (1 min)
- Point to near-autonomous on the bar
- Iterative approach: harness → skills → MCP tools → scheduled tasks → context engineering
- "Each step adds capability. You don't build everything at once."

### 12. Professional Applications (1.5 min)
- Comparison table: personal → professional
- Pipeline monitoring use case: event → agent reasons → acts or escalates
- Grid monitoring use case: same pattern
- "The shift: heuristics → contextual reasoning"

### 13. Closing (30s)
- "500 lines. Three services. Zero cloud bills."
- "Build the harness, not the app."
- Links on screen + GitHub Pages URL
- Thank you

---

## Timing Guide

| Section | Duration | Cumulative |
|---------|----------|------------|
| Title + Crab Revolution | 1:30 | 1:30 |
| OpenClaw vs NanoClaw + Harness | 2:30 | 4:00 |
| Architecture + Security | 2:30 | 6:30 |
| LIVE: Meet Andy | 2:00 | 8:30 |
| Always-On Stack + iPhone Demo | 2:30 | 11:00 |
| MCP + Autonomy + Professional | 3:30 | 14:30 |
| Closing | 0:30 | 15:00 |

---

## Emergency Recovery

- **NanoClaw down?** → Skip to architecture slides, explain what would happen
- **Telegram not responding?** → Show logs, explain the message loop
- **iPhone mirror fails?** → Describe the apps, show terminal instead
- **Slides won't load?** → Open index.html directly (works offline once loaded)
