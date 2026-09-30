#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")"
PORT="${GODMOD_PORT:-8765}"
URL="http://127.0.0.1:${PORT}/"

if command -v python3 >/dev/null 2>&1; then
  PYTHON=python3
elif command -v python >/dev/null 2>&1; then
  PYTHON=python
else
  echo "Python 3 non trovato. Apri index.html direttamente con il browser."
  exit 1
fi

echo "G0DM0D3 Portable Compare"
echo "Avvio su ${URL}"

if command -v xdg-open >/dev/null 2>&1; then
  (sleep 1; xdg-open "$URL" >/dev/null 2>&1) &
elif command -v open >/dev/null 2>&1; then
  (sleep 1; open "$URL" >/dev/null 2>&1) &
else
  echo "Apri manualmente ${URL} nel browser."
fi

exec "$PYTHON" -m http.server "$PORT" --bind 127.0.0.1
