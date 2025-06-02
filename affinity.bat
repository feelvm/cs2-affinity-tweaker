@echo off

:WAITFOR_CS2
for /f "tokens=2" %%i in ('tasklist ^| findstr /i "cs2.exe"') do set PID=%%i
if "%PID%"=="" (
    echo cs2.exe is not running. Please start cs2.exe and then run this script.
    pause
    exit /b 1
)

powershell -Command "& {Get-Process -Id %PID% | ForEach-Object { $_.ProcessorAffinity=0x000000000000FFFE }}"

taskkill /f /im nordvpn-service.exe
taskkill /f /im mysql.exe
taskkill /f /im mysqld.exe 

exit