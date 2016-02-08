@echo off

goto Header
/**
 * Windows Launcher for BWS Systems' Amazon Echo Bridge
 *
 * Author: Dale Higgs
 * Version: 1.3.7
 * License: ISC
 */
:Header

setlocal

rem === Silent Launch Settings ===
set SILENT=0

rem === HA Bridge Settings ===
set BRIDGE_JAR=ha-bridge-1.3.7.jar
set BRIDGE_IP=default
set BRIDGE_PORT=
set BRIDGE_DB=
set UPNP_PORT=
set UPNP_STRICT=
set UPNP_TRACE=

rem === Vera Settings ===
set VERA_ADDRESS=

rem === Logitech Harmony Settings ===
set HARMONY_ADDRESS=
set HARMONY_USERNAME=
set HARMONY_PASSWORD=

rem === Nest Settings ===
set NEST_USERNAME=
set NEST_PASSWORD=

rem === DO NOT EDIT ANYTHING BELOW THIS LINE ===

rem === Get this computer's IP address (if set to "default") ===
if [%BRIDGE_IP%] EQU [default] (for /f "skip=1 delims={}, " %%A in ('wmic nicconfig get ipaddress') do for /f "tokens=1" %%B in ("%%~A") do set "BRIDGE_IP=%%~B")

rem === Validate the jar file ===
if not defined BRIDGE_JAR (echo ERROR: BRIDGE_JAR is not defined in settings && goto :eof)
if not exist "%BRIDGE_JAR%" (echo ERROR: JAR file "%BRIDGE_JAR%" could not be found && goto :eof)

rem === Build the arguments list ===
set ARGS=-jar

if defined BRIDGE_IP        (set ARGS=%ARGS% -Dupnp.config.address=%BRIDGE_IP%)
if defined BRIDGE_PORT      (set ARGS=%ARGS% -Dserver.port=%BRIDGE_PORT%)
if defined BRIDGE_DB        (set ARGS=%ARGS% -Dupnp.device.db=%BRIDGE_DB%)
if defined UPNP_PORT        (set ARGS=%ARGS% -Dupnp.response.port=%UPNP_PORT%)
if defined VERA_ADDRESS     (set ARGS=%ARGS% -Dvera.address=%VERA_ADDRESS%)
if defined HARMONY_ADDRESS  (set ARGS=%ARGS% -Dharmony.address=%HARMONY_ADDRESS%)
if defined HARMONY_USERNAME (set ARGS=%ARGS% -Dharmony.user=%HARMONY_USERNAME%)
if defined HARMONY_PASSWORD (set ARGS=%ARGS% -Dharmony.pwd=%HARMONY_PASSWORD%)
if defined NEST_USERNAME    (set ARGS=%ARGS% -Dnest.user=%NEST_USERNAME%)
if defined NEST_PASSWORD    (set ARGS=%ARGS% -Dnest.pwd=%NEST_PASSWORD%)
if defined UPNP_STRICT      (set ARGS=%ARGS% -Dupnp.strict=%UPNP_STRICT%)
if defined UPNP_TRACE       (set ARGS=%ARGS% -Dtrace.upnp=%UPNP_TRACE%)

set ARGS=%ARGS% %BRIDGE_JAR%

rem === Launch the HA Bridge ===
if not defined SILENT (set SILENT=0)

if %SILENT% GTR 0 (
	start /B javaw %ARGS%
) ELSE (
	java %ARGS%
)