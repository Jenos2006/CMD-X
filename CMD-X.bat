:: script/cmd by Jenos2006

@echo off
set WHY-ARE-YOU-HERE = CRAZY
set cmdxversion=v1
set infoname=system-info.txt
set storagefile=storage.bat


:loadingscreen
call %storagefile% >NUL
cls
title DARK X CMD - LOADER
echo.
color 0C
echo 			  ___  _  _  ____    _  _
echo 			 / __)( \/ )(    \  ( \/ )
timeout 1 >NUL
color 0A
echo 			( (__ / \/ \ ) D (   )  (
timeout 1 >NUL
color 0B
echo 			 \___)\_)(_/(____/  (_/\_)
timeout 1 >NUL
color %colorset%
goto startup

:startup
cls
title CMD X - by Jenos2006
echo   ___  _  _  ____    _  _
echo  / __)( \/ )(    \  ( \/ )
echo ( (__ / \/ \ ) D (   )  (
echo  \___)\_)(_/(____/  (_/\_)
echo        by Jenos2006
echo.
echo Hello %username%!
echo CMD made by Jenos2006!
echo !!!Please don't claim that this cmd is yours!!!
echo Type cmds and have fun :)
echo Version: %cmdxversion%
echo.
goto :cmd

:cmd
title CMD X - by Jenos2006
echo.
	set /p command="--> "

		if "%command%"=="cum" goto cum
		if "%command%"=="exit" goto exit
		if "%command%"=="reload" goto reload
		if "%command%"=="dc" goto discord
		if "%command%"=="cmds" goto cmds
		if "%command%"=="help" goto help
		if "%command%"=="log" goto log
		if "%command%"=="logs" goto log
		if "%command%"=="cum" goto cum
		if "%command%"=="time" goto time
		if "%command%"=="virus" goto virus
		if "%command%"=="sysinfo" goto sysinfo
		if "%command%"=="clear" goto startup
		if "%command%"=="credits" goto credits
		if "%command%"=="genders" goto gender
		if "%command%"=="version" goto version
		if "%command%"=="calculator" goto calculator
		if "%command%"=="color" goto color
		if "%command%"=="lock" goto lock
		if "%command%"=="taskkill" goto taskkill
		if "%command%"=="tasklist" goto tasklist
		if "%command%"=="explorer" goto explorer
		if "%command%"=="echo" goto echo
		if "%command%"=="re" goto reload
		if "%command%"=="start" goto startApp
		if "%command%"=="create" goto createfile
		if "%command%"=="del" goto delete
		if "%command%"=="dcspammer" goto discord_webhook_spammer
		if "%command%"=="settings" goto settings


	echo Error! "%command%" doesnt exist.
goto cmd


:cmds
echo.
echo.
echo.
echo --------Commands--------
echo.
echo main:
echo 1.  cmds - shows all commands
echo 2.  dc - invites you in my Discordserver
echo 3.  credits - shows the CMD X credits
echo 4.  verion - Shows the CMD-Version and Windows-Version
echo 5.  settings - opens the settings
echo ------------------------
echo 6.  realod/re - reloads the cmd
echo 7.  exit - closes the cmd
echo 8.  clear - clears the cmd
echo 9.  log/logs - shows your command log
echo 10. time - shows the time of your PC
echo 11. sysinfo - shows system-infos(in a .txt file)
echo 12. calculator - calculator
echo 13. color - recolor the CMD
echo 14. lock - locks your pc(lock screen)
echo 15. tasklist - shows all active processes
echo 16. taskkill - kills a active processes
echo 17. del - deletes files [Broken]
echo 18. create - creats a file
echo.
echo fun:
echo 19. cum - idk man...
echo 20. virus - DANGER!!!
echo 21. echo - a echo
echo 22. genders - the real genders
echo 23. dcspammer - discord webhook spammer
echo.
goto cmd


:reload
start %~nx0
goto exit


:tasklist
echo Active processes:
tasklist
goto cmd

::----------------------------------------------------------------------------------------------
:settings
cls
setlocal
echo --------SETTINGS--------
echo 1. color (You are using right now "%colorset%")
echo.
echo (use "exit" to exit the settings)
echo.
echo.

set /p setting="Only the Number or the setting: "
	if "%setting%"=="exit" goto startup
	if "%setting%"=="color" goto setting_color
	if "%setting%"=="1" goto setting_color
goto settings

	:setting_color
	cls
	echo --------Background Colors--------
	echo 0 - Black
	echo 1 - Dark blue
	echo 2 - Dark green
	echo 3 - Dark cyan
	echo 4 - Dark red
	echo 5 - Dark magenta
	echo 6 - Dark yellow
	echo 7 - Light grey
	echo 8 - Dark grey
	echo 9 - Blue
	echo reset - type reset to reset the color
	echo.
	set /p color_set1="Which color you want: "
	
		if "%color_set1%"=="reset" goto settings_color_reset
		
		for /f "delims=0123456789" %%A in ("%color_set1%") do (
			echo Invalid input! Please enter a number between 0 and 9.
			timeout 2 >NUL
			goto setting_color
		)
	cls
	echo --------Text Colors--------
	echo A - Green
	echo B - Cyan
	echo C - Red
	echo D - Magenta
	echo E - Yellow
	echo F - White
	echo.
	set /p color_set2="Which color you want: "
	
	color %color_set1%%color_set2%
	set "colorset=%color_set1%%color_set2%"
	goto settings_print
		
		:settings_color_reset
		set "colorset= "
		color 
		goto settings_print
	
	:settings_print
	del %storagefile% >NUL
	echo set colorset=%colorset%> "%storagefile%"
	goto startup
::----------------------------------------------------------------------------------------------
	
	


:taskkill
cls
setlocal
set /p procname="Enter the name of the process or PID you want to kill: "
tasklist | find /i "%procname%" >nul
if errorlevel 1 (
    echo Process "%procname%" not found.
) else (
    taskkill /im "%procname%" /f >nul 2>&1
    if errorlevel 1 (
        echo Could not terminate process "%procname%".
    ) else (
        echo Process "%procname%" has ended.
    )
)
echo.
if "%procname%"=="explorer.exe" echo !!!Note: the command "explorer" will reload the explorer!!! & endlocal & timeout 5 >NUL & goto startup
timeout 2 >NUL
goto startup


:discord_webhook_spammer
echo Service not avable.
goto cmd


:delete
echo This command doesnt exist right now, sorry.
goto cmd


:startApp
setlocal
set /p filename="Enter the name filename (with extension, e.g., program.exe): "

if "%filename%"=="" (
    echo No file name entered.
    goto :cmd
)

echo.
echo --------------------------------------------------------
echo Searching for %filename% across the entire computer...

for /f "delims=" %%i in ('dir /s /b "C:\%filename%" 2^>nul') do (
    set "found_file=%%i"
    set "file_path=%%~dpi"
    
    echo File found!
    
    pushd "%file_path%"  > nul
    start %found_file%
    popd >nul
    echo --------------------------------------------------------
    goto cmd
)
echo File %filename% was not found.
echo --------------------------------------------------------
endlocal
goto cmd

:createfile
setlocal
set /p filename="Enter the name of the file (with extension, e.g., text.txt): "
set /p content="Enter the content of the file: "
echo %content% > %filename%
echo The file "%filename%" has been created.
endlocal
goto cmd


:explorer
start explorer.exe
goto cmd


:echo
setlocal
set /p echo="ECHO: "
echo You said: "%echo%"
endlocal
goto cmd


:lock
rundll32.exe user32.dll,LockWorkStation
goto cmd


:calculator
start calculator.vbs
goto cmd


:log
doskey /history
goto cmd


:cum
cls
echo.
echo.
echo __________________________
echo _________#######__________
echo ________#___#___#_________
echo _______#____#____#________
echo _______#_________#________
echo ________#########_________
echo _________#######__________
echo _________#_____#__________
echo _________#_____#__________
echo _________#_____#__________
echo _________#_____#__________
echo ______####_____####_______
echo _____##___________##______
echo _____#_____________#______
echo _____##___________##______
echo ______####_____####_______
echo.
echo Press any key to go back!
pause >NUL
goto startup


:gender
cls
echo.
echo THERE ARE ONLY THESE TWO GENDERS!
echo.
echo.
echo.
echo MALE
echo.
echo _______________________________##############_____
echo _______________________________##############_____
echo _______________________________##############_____
echo ____________________________________#########_____
echo ___________________________________##########_____
echo __________________#######_________#####__####_____
echo ______________###############___#####____####_____
echo ___________#######_______##########______####_____
echo __________#####_____________######________________
echo ________#####_________________#####_______________
echo _______#####____________________####______________
echo _______####______________________###______________
echo ______####_______________________####_____________
echo ______####________________________###_____________
echo ______####________________________###_____________
echo ______####________________________###_____________
echo _______###_______________________####_____________
echo _______####_____________________####______________
echo ________####___________________####_______________
echo _________#####________________####________________
echo __________######___________######_________________
echo ____________######_______######___________________
echo _______________#############______________________
echo __________________#######_________________________
echo.
echo.
echo.
echo.
echo.
echo FEMALE
echo.
echo _______________________###________________________
echo ___________________###########____________________
echo ________________#################_________________
echo ______________######_________#######______________
echo ____________#####_______________#####_____________
echo ___________#####__________________####____________
echo ___________####____________________####___________
echo __________####______________________####__________
echo __________###_______________________####__________
echo __________###_______________________####__________
echo __________###_______________________####__________
echo __________####______________________####__________
echo ___________###_____________________####___________
echo ___________#####__________________####____________
echo ____________######______________#####_____________
echo ______________######__________######______________
echo ________________##################________________
echo ___________________############___________________
echo _______________________###________________________
echo _______________________###________________________
echo _______________________###________________________
echo _______________###################________________
echo _______________###################________________
echo _______________###################________________
echo _______________________###________________________
echo _______________________###________________________
echo _______________________###________________________
echo _______________________###________________________
echo.
echo Press any key to go back!
pause >NUL
goto startup


:time
start time.exe
goto cmd


:virus
cls
title Virus-Sartup
echo This script made by Jenos2006.
echo Are you sure to execute this command?(y/n/yes/no)
	
	setlocal
	set Input=
	set /p virus="--> "
		if "%virus%"=="y" start virus.exe & goto exit
		if "%virus%"=="n" endlocal & goto startup
		if "%virus%"=="yes" start virus.exe & goto exit
		if "%virus%"=="no" endlocal & goto startup
echo.
echo Error
endlocal
timeout 3 >NUL
goto virus


:sysinfo
echo.
echo --------------------------------------------
echo PLEASE WAIT! IT MAY TAKE A WHILE!
if exist %~dp0%dateiname% del %infoname% & echo (The old file was deleted.) >NUL
echo.
echo   ___  _  _  ____    _  _ >%infoname%
echo  / __)( \/ )(    \  ( \/ )>>%infoname%
echo ( (__ / \/ \ ) D (   )  ( >>%infoname%
echo  \___)\_)(_/(____/  (_/\_)>>%infoname%
echo. >>%infoname%
ECHO This script made by Jenos2006! >>%infoname%
ECHO Discord: https://discord.gg/yCr38TeQ7z >>%infoname%
ECHO.>>%infoname%
ECHO.>>%infoname%
ECHO.>>%infoname%
ECHO.>>%infoname%
ECHO.>>%infoname%
ECHO.>>%infoname%
ECHO.>>%infoname%
ECHO.>>%infoname%
title PROCESS: 10%
nslookup myip.opendns.com resolver1.opendns.com>>%infoname%
ver>>%infoname%
title PROCESS: 20%
ECHO.>>%infoname%
ECHO Username:%username%>>%infoname%
title PROCESS: 30%
ECHO.>>%infoname%
ECHO Time: %time%>>%infoname%
title PROCESS: 40%
ECHO.>>%infoname%
ECHO Date: %date%>>%infoname%
title PROCESS: 50%
ECHO.>>%infoname%
netsh wlan show profiles>>%infoname%
title PROCESS: 60%
ECHO.>>%infoname%
ipconfig>>%infoname%
title PROCESS: 70%
ECHO.>>%infoname%
ECHO Additional Information:>>%infoname%
ipconfig | find /i "IPv4">>%infoname%
title PROCESS: 80%
wmic diskdrive get size>>%infoname%
wmic cpu get name>>%infoname%
title PROCESS: 90%
ECHO.>>%infoname%
ECHO.>>%infoname%
ECHO.>>%infoname%
systeminfo>>%infoname%
title PROCESS: 100% (finishing)
timeout 1 >NUL
echo.
echo !!!If you re-execute the command, the previous file will be deleted!!!
echo --------------------------------------------
start %infoname%
goto cmd

:help
echo.
echo.
echo.
echo Type cmds to lookup the commands!
echo FOR MORE HELP JOIN THE DC-SERVER(command: dc)
goto cmd

:discord
start https://discord.gg/yCr38TeQ7z
goto cmd


:version
echo.
echo CMD X version: %cmdxversion%
echo.
echo.
echo PC version:
ver
goto cmd



:credits
cls
echo.
echo   ___  _  _  ____    _  _
echo  / __)( \/ )(    \  ( \/ )
echo ( (__ / \/ \ ) D (   )  (
echo  \___)\_)(_/(____/  (_/\_)
echo.
title Jenos2006 - credits
echo This script/cmd was maded by Jenos2006!
echo !!!Please don't claim that this cmd is yours!!!
echo.
echo.
echo Discord: https://discord.gg/yCr38TeQ7z
echo.

goto cmd


:exit
exit
:: the end LOL
