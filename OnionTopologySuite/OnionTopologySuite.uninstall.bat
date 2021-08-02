@echo off
setlocal


set M9=C:\Program Files\Manifold\v9.0\shared


if exist "%M9%\OnionTopologySuite\" GOTO PROMPT
GOTO NOTHINGTOUNINSTALL

:PROMPT
SET /P AREYOUSURE=Are you sure you want to delete OnionTopologySuite ([Y]/N)?
IF /I "%AREYOUSURE%" NEQ "N" GOTO DOUNINST
GOTO DONOTWANT


:DOUNINST
cd..
del "%M9%\OnionTopologySuite\OnionTopologySuite.dll"
if exist "%M9%\OnionTopologySuite\OnionTopologySuite.dll" GOTO NOLUCK
echo OnionTopologySuite.dll deleted. 
rmdir /S /Q "%M9%\OnionTopologySuite\"
if exist "%M9%\OnionTopologySuite\" GOTO NOLUCK
goto END

:NOLUCK
echo Error: Cannot delete OnionTopologySuite.dll. Perhaps you have Manifold running.
echo %M9%\OnionTopologySuite\
GOTO END


:DONOTWANT
echo Uninstall skipped.
GOTO END

:NOTHINGTOUNINSTALL
echo Nothing to uninstall
echo OnionTopologySuite directory does not exist
GOTO END

:END
endlocal
pause
