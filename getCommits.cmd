@echo off

set END=HEAD

if /I _%1_ EQU _/?_ goto USAGE
if /I _%1_ EQU __ goto USAGE
if /I _%2_ EQU __ goto USAGE
if /I _%3_ NEQ __ set END={%3}

:: Save where you are currently
pushd .

:: Move to YOUR development directory
call cgui.bat
:: Move up to the development root directory (this will pick up changes in both wsawui and sams)
cd ..

echo Getting commits out of %CD% 1>&2

:: Get the commits from a specific date in xml format. The start date is in the
:: format YYYY-MM-DD.
svn log -v -r{%2}:%END% --xml > %TEMP%\_getcommits.xml

:: This is a node script and requires you have a few extra node_modules
:: installed. Checkout parseSvnLog.js for those. It will change the inputted XML
:: into JSON.
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
   echo    getCommits [emp#] [YYYY-MM-DD] [[YYYY-MM-DD]]
   echo.
   echo Examples:
   echo    getCommits 263952 2016-10-30 ^> commits.json
   echo    getCommits 263952 2016-10-30 2016-11-05 ^> commits.json
   echo    getCommits 263952 2016-10-30 ^| clip
   echo.
   echo Notes:
   echo    - You will want to save the results in a file for later usage in VIM Quickfix mode, OR,
   echo    - Pipe directly to the clipboard. VIM will assume this is the method being used by default.
   echo    - End date is optional and will default to HEAD if not provided.
   echo.
   goto:EOF
