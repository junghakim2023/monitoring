REM 1.get server log file from server to client
REM 2. execute log extracting info

set keyPath=%1
set server=%2
set client=%3
set fileName=%4
set batProcessFilepath=%5

scp -i %key% -P 22 %server% %client%
%batProcessFilepath% %fileName%
