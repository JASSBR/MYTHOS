#!/bin/bash
# ============================================================
#  MYTHOS — Share with friends via ngrok
# ============================================================
#
#  Architecture:
#    [Friends] → ngrok → proxy(:8080) → frontend(:3000)
#                                      → backend(:3001)
#
#  Prerequisites:
#    1. brew install ngrok
#    2. ngrok config add-authtoken YOUR_TOKEN
#    3. Docker running (PostgreSQL + Redis)
#    4. Backend running: cd backend && npm run start:dev
#    5. Frontend running: cd MythosWebPlatform && npm run dev
#
# ============================================================

set -e
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo ""
echo -e "${CYAN}╔══════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║       MYTHOS — Partage avec ngrok            ║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════╝${NC}"
echo ""

# Check prerequisites
if ! command -v ngrok &> /dev/null; then
  echo -e "${RED}ngrok n'est pas installe.${NC}"
  echo "  brew install ngrok"
  echo "  ngrok config add-authtoken TON_TOKEN"
  exit 1
fi

if ! command -v node &> /dev/null; then
  echo -e "${RED}node n'est pas dans le PATH.${NC}"
  exit 1
fi

# Cleanup function
cleanup() {
  echo ""
  echo -e "${YELLOW}Arret...${NC}"
  kill $NGROK_PID 2>/dev/null
  kill $PROXY_PID 2>/dev/null
  # Restore local env
  cat > "$SCRIPT_DIR/MythosWebPlatform/.env.local" << EOF
NEXT_PUBLIC_API_URL=http://localhost:3001/api
NEXT_PUBLIC_SOCKET_URL=http://localhost:3001/game
EOF
  echo -e "${GREEN}.env.local restaure en mode local.${NC}"
  exit 0
}
trap cleanup SIGINT SIGTERM

# Kill previous instances
pkill -f "node.*proxy.js" 2>/dev/null || true
pkill -f ngrok 2>/dev/null || true
sleep 1

# Step 1: Update frontend .env to use relative URLs (same origin via proxy)
echo -e "${YELLOW}[1/3]${NC} Configuration du frontend pour le proxy..."
cat > "$SCRIPT_DIR/MythosWebPlatform/.env.local" << EOF
NEXT_PUBLIC_API_URL=/api
NEXT_PUBLIC_SOCKET_URL=/game
EOF
echo "  -> .env.local mis a jour (URLs relatives)"

# Step 2: Start the reverse proxy
echo -e "${YELLOW}[2/3]${NC} Demarrage du proxy sur :8080..."
node "$SCRIPT_DIR/proxy.js" &
PROXY_PID=$!
sleep 1

# Step 3: Start ngrok (single tunnel on port 8080)
echo -e "${YELLOW}[3/3]${NC} Demarrage du tunnel ngrok..."
ngrok start --all --config "$SCRIPT_DIR/ngrok.yml" > /dev/null 2>&1 &
NGROK_PID=$!

# Wait for ngrok API
PUBLIC_URL=""
for i in $(seq 1 15); do
  sleep 1
  PUBLIC_URL=$(curl -s http://localhost:4040/api/tunnels 2>/dev/null \
    | python3 -c "import sys,json; print(json.load(sys.stdin)['tunnels'][0]['public_url'])" 2>/dev/null || echo "")
  if [ -n "$PUBLIC_URL" ]; then
    break
  fi
  echo -n "."
done
echo ""

if [ -z "$PUBLIC_URL" ]; then
  echo -e "${RED}Impossible de recuperer l'URL ngrok.${NC}"
  echo "  Essaie: ngrok http 8080"
  cleanup
  exit 1
fi

echo ""
echo -e "${CYAN}════════════════════════════════════════════════${NC}"
echo ""
echo -e "  ${GREEN}Partage ce lien avec tes amis:${NC}"
echo ""
echo -e "    ${CYAN}${PUBLIC_URL}${NC}"
echo ""
echo -e "  ${YELLOW}Note:${NC} Au premier acces, cliquer 'Visit Site'."
echo ""
echo "  Comptes de test (lance db:seed d'abord):"
echo "    Admin:  admin@mythos.fr / Password123!"
echo "    Joueur: alice@mythos.fr / Password123!"
echo ""
echo -e "  ${YELLOW}Assure-toi que ces services tournent:${NC}"
echo "    - Docker (PostgreSQL + Redis)"
echo "    - Backend:  cd backend && npm run start:dev"
echo "    - Frontend: cd MythosWebPlatform && npm run dev"
echo ""
echo -e "${CYAN}════════════════════════════════════════════════${NC}"
echo ""
echo -e "  Appuie sur ${RED}Ctrl+C${NC} pour tout arreter."
echo ""

# Keep alive
wait $NGROK_PID
