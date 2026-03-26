#!/usr/bin/env bash
# ── AI Tinkerers Calgary — Live Demo Script ──────────────────────
# Run this in a visible terminal during the presentation.
# It walks through each command with explanations.

set -euo pipefail

CYAN='\033[0;36m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

pause() {
  echo ""
  echo -e "${ORANGE}▶ Press ENTER to continue...${NC}"
  read -r
  echo ""
}

banner() {
  echo ""
  echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BOLD}${CYAN}  $1${NC}"
  echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

explain() {
  echo -e "${GREEN}# $1${NC}"
}

# ── Step 1: Service Status ──────────────────────────────────────
banner "🦀 Step 1: NanoClaw launchd Service Status"
explain "Checking if nanoclaw is running as a launchd service..."
pause
launchctl list | grep com.nanoclaw || echo -e "${RED}Service not found — may need to load it${NC}"

# ── Step 2: Live Logs ───────────────────────────────────────────
banner "🦀 Step 2: Recent NanoClaw Logs"
explain "Last 25 lines of the nanoclaw log. Watch for container spawn events..."
pause
tail -25 ~/Repos/personal/nanoclaw/logs/nanoclaw.log 2>/dev/null || echo -e "${RED}Log file not found${NC}"

# ── Step 3: Registered Groups ──────────────────────────────────
banner "🦀 Step 3: Registered Groups"
explain "These are the isolated agent groups — each gets its own container..."
pause
python3 -m json.tool ~/Repos/personal/nanoclaw/data/registered_groups.json 2>/dev/null || echo -e "${RED}Groups file not found${NC}"

# ── Step 4: Active Sessions ────────────────────────────────────
banner "🦀 Step 4: Active Claude Sessions"
explain "Session IDs enable conversation continuity across container spawns..."
pause
python3 -m json.tool ~/Repos/personal/nanoclaw/data/sessions.json 2>/dev/null || echo -e "${RED}Sessions file not found${NC}"

# ── Step 5: Watch for Events ───────────────────────────────────
banner "🦀 Step 5: Live Event Monitoring"
explain "Tailing logs in real-time. Send a Telegram message to Andy now!"
explain "Look for: 'Spawning container agent' and 'Container completed'"
pause
echo -e "${ORANGE}Ctrl+C to stop watching...${NC}"
tail -f ~/Repos/personal/nanoclaw/logs/nanoclaw.log 2>/dev/null || echo -e "${RED}Log file not found${NC}"
