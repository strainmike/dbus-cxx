start test-property server %1

:waitstart
tasklist|find "test-property"
IF %ERRORLEVEL% == 0 GOTO :startclient
GOTO :waitstart

:startclient
test-property client %1
set CLIENT_ERRORLEVEL=%ERRORLEVEL%

:waitstop
tasklist|find "test-property"
IF NOT %ERRORLEVEL% == 0 GOTO :endtest
GOTO :waitstop

:endtest
EXIT /B %CLIENT_ERRORLEVEL%
