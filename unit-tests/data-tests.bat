start data-tests server %1

:waitstart
tasklist|find "data-tests"
IF %ERRORLEVEL% == 0 GOTO :startclient
GOTO :waitstart

:startclient
data-tests client %1
set CLIENT_ERRORLEVEL=%ERRORLEVEL%

:waitstop
tasklist|find "data-tests"
IF NOT %ERRORLEVEL% == 0 GOTO :endtest
GOTO :waitstop

:endtest
EXIT /B %CLIENT_ERRORLEVEL%
