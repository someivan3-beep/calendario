@echo off
setlocal
cd /d "%~dp0"

where python >nul 2>nul
if %errorlevel%==0 (
  start "Servidor calendario" python -m http.server 8012
) else (
  where py >nul 2>nul
  if %errorlevel%==0 (
    start "Servidor calendario" py -3 -m http.server 8012
  ) else (
    echo No se encontro Python. Instala Python o usa otro servidor local.
    pause
    exit /b 1
  )
)

timeout /t 1 >nul
start "" "http://localhost:8012/calendario_definitivo.html"
