#!/bin/sh
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
  printf "Premi Invio per chiudere..."
  read _answer
  exit 1
fi

echo "G0DM0D3 Portable Compare"
echo "Avvio su ${URL}"
(sleep 1; open "$URL") &
exec "$PYTHON" -m http.server "$PORT" --bind 127.0.0.1
