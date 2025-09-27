@echo on

setlocal enabledelayedexpansion

%PYTHON% -m pip install . -vv --no-deps
if errorlevel 1 exit /b 1
