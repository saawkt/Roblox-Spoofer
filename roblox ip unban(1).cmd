@echo off
title Roblox Unban, made by misenplase and saawkt
taskkill /f /im RobloxPlayerBeta.exe /t 
certutil -URLCache * delete
netsh int ip reset
netsh int ipv4 reset
netsh int ipv6 reset
ipconfig /release >nul
ipconfig /renew >nul
ipconfig /flushdns >nul
netsh advfirewall reset
netsh winsock reset
netsh int ip reset
netsh winsock reset
netsh advfirewall reset
::tmac
curl -L "https://github.com/saawkt/files/raw/refs/heads/main/tmac/oui.db" -o "C:\Windows\temp\oui.db"
curl -L "https://github.com/saawkt/files/raw/refs/heads/main/tmac/TMAC.exe" -o "C:\Windows\temp\tmac.exe"
cls
cd /d "C:\Windows\temp"
tmac.exe -n Ethernet -r -s 
tmac.exe -n Ethernet -re -s 
timeout /t 5 /nobreak >nul
taskkill /f /im tmac.exe /t 
taskkill /f /im TMAC.exe /t
del C:\Windows\temp\tmac.exe
del C:\Windows\temp\oui.db 
cls
for /f "tokens=*" %%a in ('wevtutil el') do (
wevtutil cl "%%a"
)
cls
del /s /q /f %LocalAppData%\Roblox\LocalStorage\RobloxCookies.dat
del /s /q /f %LocalAppData%\Roblox\LocalStorage\memProfStorage8688.json
del /s /q /f %LocalAppData%\Roblox\LocalStorage\appStorage.json
set "warpPath=%ProgramFiles%\Cloudflare\Cloudflare WARP\Cloudflare WARP.exe"
if exist "%warpPath%" (
echo Cloudflare WARP founded, opening the app...
start "" "%warpPath%"
) else (
echo Cloudflare WARP has not been found, downloading the installer...
curl -L "https://downloads.cloudflareclient.com/v1/download/windows/ga" -o "C:\Windows\temp\warp.msi"
start /b /wait "" "C:\Windows\temp\warp.msi" /passive >nul 2>&1
del C:\Windows\temp\warp.msi
)
echo your cloudflare warp has opened, is it in background, open to use
echo if warp dont installed a link gonna be opened soon
echo if done, just open and start service and close this cmd
pause >nul
exit /b 
