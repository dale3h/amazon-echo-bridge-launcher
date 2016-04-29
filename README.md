Windows Launcher for BWS Systems' Amazon Echo Bridge
=========

Configurable Windows launcher for [BWS Systems'](http://www.bwssystems.com/) [Amazon Echo Bridge](https://github.com/bwssytems/ha-bridge/)

## Installation
Place the `ha-bridge.bat` file in the same directory as the BWS Systems' `ha-bridge-X.X.X.jar` file.

## Configuration
* **VERSION**
  * Specify a version number to launch
  * Default (empty) is auto-detection based on last file modified time
* **SILENT**
  * 0 = Show console window
  * 1 = Hide console window
  * Default is `0`
* **BRIDGE_JAR**
  * HA Bridge JAR file
  * Default is `ha-bridge-X.X.X.jar` (X.X.X being the version number)
* **BRIDGE_CONFIG**
  * Config file location
  * Default is `data/habridge.config`

## Changelog

#### 2016-04-28
* Added auto-detection for latest version (uses Last Modified file time)
* Skip pause commands when running silently

#### 1.4.1
* Removed old command line arguments
* Added `-Dconfig.file=<filepath>` command line argument
* Updated version to match 1.4.1

#### 1.3.8
* Fix: Show console window until errors are dismissed

#### 1.3.7
* Just getting started...