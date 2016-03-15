@echo off

goto Header
/**
 * Windows Launcher for BWS Systems' Amazon Echo Bridge <https://github.com/bwssytems/ha-bridge/>
 *
 * Author: Dale Higgs
 * Version: 1.4.1
 * License: ISC
 */
:Header

setlocal

rem === Silent Launch Settings ===
set SILENT=0

rem === HA Bridge Settings ===
set BRIDGE_JAR=ha-bridge-1.4.1.jar
set BRIDGE_CONFIG=data/habridge.config

rem === Validate the jar file ===
if not defined BRIDGE_JAR (echo ERROR: BRIDGE_JAR is not defined in settings && pause && goto :eof)
if not exist "%BRIDGE_JAR%" (echo ERROR: JAR file "%BRIDGE_JAR%" could not be found && pause && goto :eof)

rem === Build the arguments list ===
set ARGS=-jar

if defined BRIDGE_CONFIG (set ARGS=%ARGS% -Dconfig.file=%BRIDGE_CONFIG%)

set ARGS=%ARGS% %BRIDGE_JAR%

rem === Launch the HA Bridge ===
if not defined SILENT (set SILENT=0)

if %SILENT% GTR 0 (
	start /B javaw %ARGS%
) else (
	java %ARGS%
)