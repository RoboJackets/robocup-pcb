@echo off
cd  %~p0
set link_path=%EAGLE%
set count=0

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
	echo.
    ) else (
        echo Failure: Current permissions inadequate.
	echo.
	goto:error
    )

:restart
echo Is "%link_path%" the program directory location for EAGLE ([Y]/N)?
SET /P input= 
CLS
if /i %input%==n (goto:set-path)
if /i %input%==no (goto:set-path)
if /i %input%==y (goto:yes)
if /i %input%==yes (goto:yes)
goto:restart

:yes
for /r %%i in (*.lbr) do (call :set-links %%i)
goto:break

:set-links
2>NUL mklink "%link_path%\lbr\%~nx1" "%1" >NUL
IF ERRORLEVEL 1 (set /a error_count+=1)
SET /a count+=1
goto:eof

:set-path
SET input= 
echo Type the FULL PATH (including drive letter) of the EAGLE directory location. Do NOT include quotation marks (") before or after the path name: 
SET /P link_path= 
goto:restart

:break
ECHO.
SET /a link_count=%count%-%error_count%
ECHO	 (%link_count%/%count%) links created.
ECHO.
:error
pause

:end_script