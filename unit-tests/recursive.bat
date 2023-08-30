start test-recursive B

:waitstart
tasklist|find "test-recursive"
IF %ERRORLEVEL% == 0 GOTO :startclient
GOTO :waitstart

:startclient
test-recursive A
set CLIENT_ERRORLEVEL=%ERRORLEVEL%

:waitstop
tasklist|find "test-recursive"
IF NOT %ERRORLEVEL% == 0 GOTO :endtest
GOTO :waitstop

:endtest
EXIT /B %CLIENT_ERRORLEVEL%
