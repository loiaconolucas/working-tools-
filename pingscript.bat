@echo off
setlocal enabledelayedexpansion

set OUTPUT_FILE=results.txt
>nul copy nul %OUTPUT_FILE%
for /f %%i in (servers.txt) do (
    set SERVER_ADDRESS=ADDRESS N/A
    for /f "tokens=1,2,3" %%x in ('ping -n 1 %%i ^&^& echo SERVER_IS_UP') do (
        if %%x==Pinging set SERVER_ADDRESS=%%y
        if %%x==Reply set SERVER_ADDRESS=%%z
        if %%x==SERVER_IS_UP (set SERVER_STATE=UP) else (set SERVER_STATE=DOWN)
    )
    echo %%i [!SERVER_ADDRESS::=!] is !SERVER_STATE!
echo %%i [!SERVER_ADDRESS::=!] is !SERVER_STATE! >>%OUTPUT_FILE%
)
PAUSE
