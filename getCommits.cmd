@echo off

if /I _%1_ EQU _/?_ goto USAGE
if /I _%1_ EQU __ goto USAGE
if /I _%2_ EQU __ goto USAGE


:: Save where you are currently
pushd .

:: Move to YOUR development directory
call cgui.bat

:: Get the commits from a specific date in xml format. The start date is in the
:: format YYYY-MM-DD.
svn log -v -r{%2}:HEAD --xml > %TEMP%\_getcommits.xml

:: This is a node script and requires you have a few extra node_modules
:: installed. Checkout parseSvnLog.js for those.
node %BIN%\parseSvnLog.js %1 %TEMP%\_getcommits.xml

:: Go back to where you started
popd

:: Exit
goto:EOF

::------------------------------------------
:: @function usage
::------------------------------------------
:USAGE
   echo Usage:
   echo    getCommits [emp#] [YYYY-MM-DD]
   echo.
   echo Example:
   echo    getCommits 263952 2016-10-30 ^> commits.json
   echo.
   goto:EOF
