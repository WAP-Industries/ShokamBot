@echo off
setlocal enabledelayedexpansion
cd /
cd %~dp0

set "taskname=ShokamBot"
set "tasksettings=$TaskSettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable;"

schtasks /create /tn "%taskname%" /tr "%cd%\run.bat" /sc hourly /mo 6 /st 00:00:00 /f
powershell -command %tasksettings%"Set-ScheduledTask -TaskName %taskname% -Settings $TaskSettings"

endlocal