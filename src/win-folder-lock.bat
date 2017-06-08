CLS
@ECHO OFF
title WFL - Win Folder Lock

SET _FOLDER_DIRECTORY_NAME_=_FOLDER_TO_HIDE
SET _USER_PASSWORD_=password123

if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK 
if NOT EXIST %_FOLDER_DIRECTORY_NAME_% goto MDLOCKER
:CONFIRM
echo Tem certeza que deseja trancar a pasta?(S/N)
set/p "cho=>"
if %cho%==S goto LOCK
if %cho%==s goto LOCK
if %cho%==n goto END
if %cho%==N goto END
echo Escolha Invalida!
pause
cls
goto CONFIRM
:LOCK
cls
ren %_FOLDER_DIRECTORY_NAME_% "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Pasta Trancada!
pause
goto End
:UNLOCK
cls
echo ...!
set/p "pass=>"
if NOT %pass%== %_USER_PASSWORD_% goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" %_FOLDER_DIRECTORY_NAME_%
cls
echo Pasta desbloqueada!
pause
goto End
:FAIL
cls
echo n!
pause
goto UNLOCK
:MDLOCKER
md %_FOLDER_DIRECTORY_NAME_%
echo _Security criada com Sucesso!
goto End
:End 