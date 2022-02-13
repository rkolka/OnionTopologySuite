@echo off
setlocal

set M9=C:\Program Files\Manifold\v9.0\shared\Addins

if exist "%M9%\OnionTopologySuite\" GOTO ALREADYINSTALLED
GOTO DOINST


:DOINST
echo ------- Creating directory OnionTopologySuite 
echo ------- under %M9%\ 
mkdir "%M9%\OnionTopologySuite"
if exist "%M9%\OnionTopologySuite\" GOTO COPYFILES 
GOTO CANNOTCREATEDIR

:COPYFILES
echo ------- Copying add-in files
copy NetTopologySuite.dll "%M9%\OnionTopologySuite\"
copy NetTopologySuite.Lab.dll "%M9%\OnionTopologySuite\"
copy System.Runtime.CompilerServices.Unsafe.dll "%M9%\OnionTopologySuite\"
copy System.Buffers.dll "%M9%\OnionTopologySuite\"
copy System.Memory.dll "%M9%\OnionTopologySuite\"
copy System.Numerics.Vectors.dll "%M9%\OnionTopologySuite\"

copy OnionTopologySuite.dll "%M9%\OnionTopologySuite\"
copy OnionTopologySuite.dll.addin "%M9%\OnionTopologySuite\"
copy OnionTopologySuite.map "%M9%\OnionTopologySuite\"

copy OnionTopologySuiteWKB.sql "%M9%\OnionTopologySuite\"
copy OnionTopologySuiteGEOM.sql "%M9%\OnionTopologySuite\"
copy OnionTopologySuiteTest.sql "%M9%\OnionTopologySuite\"

copy OnionTopologySuite.uninstall.bat "%M9%\OnionTopologySuite\"
copy OnionTopologySuite.md.txt "%M9%\OnionTopologySuite\"
copy OnionTopologySuite.txt "%M9%\OnionTopologySuite\"
copy NTSLicense.md.txt "%M9%\OnionTopologySuite\"
goto END

:CANNOTCREATEDIR
echo Error: Cannot create Addin directory.
echo You must have write permission for %M9%
goto END

:ALREADYINSTALLED
echo Error: Cannot install
echo OnionTopologySuite directory already exists
echo Try running %M9%\OnionTopologySuite\OnionTopologySuite.uninstall.bat first
GOTO END

:END
endlocal
pause
