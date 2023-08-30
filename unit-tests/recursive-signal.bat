start test-recursive-signal B

:waitstart
tasklist|find "test-recursive-signal"
IF %ERRORLEVEL% == 0 GOTO :startclient
GOTO :waitstart

:startclient
test-recursive-signal A
set CLIENT_ERRORLEVEL=%ERRORLEVEL%

:waitstop
tasklist|find "test-recursive-signal"
IF NOT %ERRORLEVEL% == 0 GOTO :endtest
GOTO :waitstop

:endtest
EXIT /B %CLIENT_ERRORLEVEL%
