@ For %%G in ("..\PortableGit\bin\gh.exe") do set gitdir=%%~pG
@ set "PATH=%PATH%;%gitdir%"
@ echo Crear un repo, local y online
@ echo Requiere que tengas una cuenta ya hecha en github

@ choice /c NB /m "normal o bruto?"
@ if %errorlevel% == 1 set pre=normal
@ if %errorlevel% == 2 set pre=bruto

@ choice /c BN /m "blanco o negro?"
@ if %errorlevel% == 2 set "color=style="background-color: #101010;  color: #ffffff""

@ if %pre% == normal echo ^<^!DOCTYPE html^> > index.html & echo ^<html^> >> index.html & echo. >> index.html & echo ^<head^> >> index.html & echo     ^<meta http-equiv="content-type" content="text/html; charset=UTF-8"^> >> index.html & echo ^<^/head^> >> index.html & echo. >> index.html & echo ^<body %color% ^> >> index.html & echo ^<p style="white-space:pre-wrap"^> >> index.html
@ if %pre% == bruto  echo ^<^!DOCTYPE html^> > index.html & echo ^<html^> >> index.html & echo. >> index.html & echo ^<head^> >> index.html & echo     ^<meta http-equiv="content-type" content="text/html; charset=UTF-8"^> >> index.html & echo ^<^/head^> >> index.html & echo. >> index.html & echo ^<body %color% ^> >> index.html & echo ^<pre^> >> index.html



echo. > "text, blank lines must be a space.txt"
start /wait " " notepad "text, blank lines must be a space.txt"

For /F "usebackq delims=" %%i IN (".\text, blank lines must be a space.txt") DO (
if "%%i" == " " echo. >> index.html
if NOT "%%i" == " " echo %%i >> index.html
)

if %pre% == normal echo ^</p^> >> index.html & echo ^<^/body^> >> index.html & echo. >> index.html & echo ^<^/html^> >>index.html
if %pre% == bruto  echo ^</pre^> >> index.html & echo ^<^/body^> >> index.html & echo. >> index.html & echo ^<^/html^> >>index.html

del "CHANGE TO*"
ren index.html "CHANGE TO UTF-8 AND EXIT. SAVE ON WWW FOLDER.html"

start /wait "CHANGE TO UTF-8 AND EXIT" notepad "CHANGE TO UTF-8 AND EXIT. SAVE ON WWW FOLDER.html"
ren "CHANGE TO UTF-8 AND EXIT. SAVE ON WWW FOLDER.html" index.html


@ choice /c WL /m "web o local?"
@ if %errorlevel% == 1 goto github
@ if %errorlevel% == 2 goto local

exit

:github
git checkout --orphan temp_branch
git add -A
git commit -a -m "web"
git branch -D master
git branch -m master
git push -f repo-web master

@ for /F "tokens=2,3,4 delims=/(" %%A in ('git remote -v^|find "fetch"') do @ set "un=%%B" & set "repo=%%C"
@ SET repo=%repo:~0,-5%
@ echo.
@ echo.
@ set/p "blank={%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&}" <nul
@ echo.
@ echo.
@ echo   the web is up at https://%un%.github.io/%repo%/
@ echo.
@ set/p "blank={%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&-~%&}" <nul
@ echo.
@ echo.
@ echo.
@ choice /c YN /m "copy to clipboard?"
@ if %errorlevel% EQU 1 (echo https://%un%.github.io/%repo%/|clip)
@ echo.
@ echo.
@ echo Presione una tecla para salir.
@ pause >nul 2>&1
@ goto:eof


:local
cd ..
start monatiny.exe
@echo off
FOR /F "tokens=2 delims= " %%a IN ('arp -a ^| findstr Interfaz') DO set ip=%%a
echo ip is    %ip%
pause
goto:eof