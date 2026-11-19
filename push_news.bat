@echo off
setlocal
cd /d "%~dp0"
set "LOG=%USERPROFILE%\din_push.log"
for /f %%d in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set "TODAY=%%d"
echo ===== %TODAY% %time% >> "%LOG%"
git pull --rebase --autostash origin main >> "%LOG%" 2>&1
git add news/*.txt >> "%LOG%" 2>&1
git diff --cached --quiet
if %errorlevel%==0 (
  echo no changes >> "%LOG%"
  exit /b 0
)
git -c user.name=sjc4197 -c user.email=sjc4197@users.noreply.github.com commit -m "news: %TODAY%" >> "%LOG%" 2>&1
git push origin HEAD:main >> "%LOG%" 2>&1
if errorlevel 1 (
  echo PUSH FAILED >> "%LOG%"
  exit /b 1
)
echo PUSH OK >> "%LOG%"
exit /b 0
