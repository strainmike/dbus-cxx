start introspection-tests server %1

:waitstart
tasklist|find "introspection-tests"
IF %ERRORLEVEL% == 0 GOTO :startclient
GOTO :waitstart

:startclient
introspection-tests client %1
set CLIENT_ERRORLEVEL=%ERRORLEVEL%

:waitstop
tasklist|find "introspection-tests"
IF NOT %ERRORLEVEL% == 0 GOTO :endtest
GOTO :waitstop

:endtest
EXIT /B %CLIENT_ERRORLEVEL%
