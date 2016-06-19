echo off

set FILE=control-2008-a

SET REPO_PATH=%HOMEDRIVE%%HOMEPATH%\Documents\GitHub\robocup-pcb
cd /d %REPO_PATH%
cd archive-pcb\%FILE%

SET SCRIPT_PATH=%REPO_PATH%\scripts\export-brd.scr
SET SETTINGS=%REPO_PATH%\eagle.epf
SET COMMAND1=SCRIPT %SCRIPT_PATH%;
SET COMMAND=EDIT %REPO_PATH%\archive-pcb\%FILE%\%FILE%.brd; %COMMAND1% CLOSE;

SET EAGLE=%PROGRAMFILES(x86)%\eagle-6.5.0\bin\eagle.exe
cmd /c CALL START "" "%EAGLE%" -C ^"%COMMAND%^" %REPO_PATH%\retired-pcb\%FILE%\%FILE%.brd
exit
exit