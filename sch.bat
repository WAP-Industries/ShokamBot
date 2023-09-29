@echo off
setlocal enabledelayedexpansion
cd /
cd %~dp0

set "taskname=ShokamBot"
set "tasksettings=$TaskSettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable;"

schtasks /create /tn "%taskname%" /tr "%cd%\run.bat" /sc daily /st "14:00"
powershell -command %tasksettings%"Set-ScheduledTask -TaskName %taskname% -Settings $TaskSettings"

endlocal