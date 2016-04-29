@echo off

goto Header
/**
 * Windows Launcher for BWS Systems' Amazon Echo Bridge <https://github.com/bwssytems/ha-bridge/>
 *
 * Author: Dale Higgs
 * License: ISC
 */
:Header

setlocal

rem === Bridge Version (leave empty for auto) ===
set VERSION=

rem === Silent Launch Settings ===
set SILENT=0

rem === HA Bridge Settings ===
set BRIDGE_CONFIG=

rem === Detect Latest Version ===
if not defined VERSION (
	for /f %%i in ('dir /B /A:-D /O:-D /T:W ha-bridge-*.jar') do (
		set BRIDGE_JAR=%%i
		goto FoundJarFile
	)
)

rem === HA Bridge JAR File ===
set BRIDGE_JAR=ha-bridge-%VERSION%.jar

:FoundJarFile

if not defined SILENT (set SILENT=0)

rem === Validate the jar file ===
if not defined BRIDGE_JAR (
	echo ERROR: JAR file could not be found
	if %SILENT% leq 0 pause
	goto :eof
)

if not exist "%BRIDGE_JAR%" (
	echo ERROR: JAR file "%BRIDGE_JAR%" could not be found
	if %SILENT% leq 0 pause
	goto :eof
)

rem === Build the arguments list ===
set ARGS=-jar

if defined BRIDGE_CONFIG (set ARGS=%ARGS% -Dconfig.file=%BRIDGE_CONFIG%)

set ARGS=%ARGS% %BRIDGE_JAR%

rem === Launch the HA Bridge ===
echo Using JAR file "%BRIDGE_JAR%"

if %SILENT% gtr 0 (
	start /B javaw %ARGS%
) else (
	java %ARGS%
)
