@echo off
setlocal
cd /d "%~dp0"
echo G0DM0D3 Portable Compare
echo Avvio su http://127.0.0.1:8765/
py -c "import sys" >nul 2>nul
if %errorlevel%==0 (
  start "" http://127.0.0.1:8765/
  py -m http.server 8765 --bind 127.0.0.1
  goto :eof
)
python -c "import sys" >nul 2>nul
if %errorlevel%==0 (
  start "" http://127.0.0.1:8765/
  python -m http.server 8765 --bind 127.0.0.1
  goto :eof
)
echo Python non trovato: apro index.html direttamente.
echo Se il browser blocca le richieste, installa Python oppure usa un server statico portatile.
start "" "%~dp0index.html"
endlocal
