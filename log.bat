REM 1. release log.zip file 
REM 2. extract line only include specific word
REM 3. arrage and save as output

echo off
echo %1

set "PATH=%PATH%;C:\Program Files\7-Zip"
set "PATH=%PATH%;C:\Windows\System32"
set emptySpace=
set originZipPath=%1


call set zipDirPath=%%originZipPath:.gz=%word%%%
echo %zipDirPath%
set folderName=%zipDirPath%.txt

REM 1. release log.zip file 
REM ## zip release to .txt##
REM C:\Program\test.gz -> C:\Program\test\test.txt\
7z e "%1" -o"%folderName%"

call set fileName=%%originZipPath:C:\Project\logs\nginx=%word%%%

set totalPath=%folderName%%fileName%
set outputFile=C:\Project\logs\logResult%fileName%

echo %outputFile%
set targetWord=compute.amazonaws.com/

REM 2. extract line only include specific word
set charCount=50
type nul > %outputFile%
findstr /i "%targetWord%"  "%totalPath%"> "%outputFile%"

REM 3. arrage and save as output
setlocal enabledelayedexpansion
(for /f "delims=" %%a in (%outputFile%) do (
    set "line=%%a"
    set "line=!line:~0,%charCount%!"
    echo !line!
)) > %outputFile%.tmp

move /y %outputFile%.tmp %outputFile%
