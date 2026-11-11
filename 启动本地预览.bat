@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ============================================
echo  Local:  http://localhost:8000
echo  LAN IP (open this on your phone):
ipconfig | findstr /C:"IPv4"
echo ============================================
echo  Keep this window open. Ctrl+C to stop.
echo.
python -m http.server 8000
pause
