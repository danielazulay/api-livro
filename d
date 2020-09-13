[33mcommit 0aa7ffdacfb97bb1446020c04166ed5d6283f818[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m)[m
Author: Daniel Azulay <danielazulay20@gmail.com>
Date:   Sun Sep 13 19:57:54 2020 -0300

    primeira

[1mdiff --git a/node_modules/.bin/mime b/node_modules/.bin/mime[m
[1mnew file mode 100644[m
[1mindex 0000000..91e5e16[m
[1m--- /dev/null[m
[1m+++ b/node_modules/.bin/mime[m
[36m@@ -0,0 +1,15 @@[m
[32m+[m[32m#!/bin/sh[m
[32m+[m[32mbasedir=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')")[m
[32m+[m
[32m+[m[32mcase `uname` in[m
[32m+[m[32m    *CYGWIN*|*MINGW*|*MSYS*) basedir=`cygpath -w "$basedir"`;;[m
[32m+[m[32mesac[m
[32m+[m
[32m+[m[32mif [ -x "$basedir/node" ]; then[m
[32m+[m[32m  "$basedir/node"  "$basedir/../mime/cli.js" "$@"[m
[32m+[m[32m  ret=$?[m
[32m+[m[32melse[m[41m [m
[32m+[m[32m  node  "$basedir/../mime/cli.js" "$@"[m
[32m+[m[32m  ret=$?[m
[32m+[m[32mfi[m
[32m+[m[32mexit $ret[m
[1mdiff --git a/node_modules/.bin/mime.cmd b/node_modules/.bin/mime.cmd[m
[1mnew file mode 100644[m
[1mindex 0000000..746a279[m
[1m--- /dev/null[m
[1m+++ b/node_modules/.bin/mime.cmd[m
[36m@@ -0,0 +1,17 @@[m
[32m+[m[32m@ECHO off[m
[32m+[m[32mSETLOCAL[m
[32m+[m[32mCALL :find_dp0[m
[32m+[m
[32m+[m[32mIF EXIST "%dp0%\node.exe" ([m
[32m+[m[32m  SET "_prog=%dp0%\node.exe"[m
[32m+[m[32m) ELSE ([m
[32m+[m[32m  SET "_prog=node"[m
[32m+[m[32m  SET PATHEXT=%PATHEXT:;.JS;=;%[m
[32m+[m[32m)[m
[32m+[m
[32m+[m[32m"%_prog%"  "%dp0%\..\mime\cli.js" %*[m
[32m+[m[32mENDLOCAL[m
[32m+[m[32mEXIT /b %errorlevel%[m
[32m+[m[32m:find_dp0[m
[32m+[m[32mSET dp0=%~dp0[m
[32m+[m[32mEXIT /b[m
[1mdiff --git a/node_modules/.bin/mime.ps1 b/node_modules/.bin/mime.ps1[m
[1mnew file mode 100644[m
[1mindex 0000000..a6f6f47[m
[1m--- /dev/null[m
[1m+++ b/node_modules/.bin/mime.ps1[m
[36m@@ -0,0 +1,18 @@[m
[32m+[m[32m#!/usr/bin/env pwsh[m
[32m+[m[32m$basedir=Split-Path $MyInvocation.MyCommand.Definition -Parent[m
[32m+[m
[32m+[m[32m$exe=""[m
[32m+[m[32mif ($PSVersionTable.PSVersion -lt "6.0" -or $IsWindows) {[m
[32m+[m[32m  # Fix case when both the Windows and Linux builds of Node[m
[32m+[m[32m  # are installed in the same directory[m
[32m+[m[32m  $exe=".exe"[m
[32m+[m[32m}[m
[32m+[m[32m$ret=0[m
[32m+[m[32mif (Test-Path "$basedir/node$exe") {[m
[32m+[m[32m  & "$basedir/node$exe"  "$basedir/../mime/cli.js" $args[m
[32m+[m[32m  $ret=$LASTEXITCODE[m
[32m+[m[32m} else {[m
[32m+[m[32m  & "node$exe"  "$basedir/../mime/cli.js" $args[m
[32m+[m[32m  $ret=$LASTEXITCODE[m
[32m+[m[32m}[m
[32m+[m[32mexit $ret[m
[1mdiff --git a/node_modules/.bin/semver b/node_modules/.bin/semver[m
[1mnew file mode 100644[m
[1mindex 0000000..10497aa[m
[1m--- /dev/null[m
[1m+++ b/node_modules/.bin/semver[m
[36m@@ -0,0 +1,15 @@[m
[32m+[m[32m#!/bin/sh[m
[32m+[m[32mbasedir=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')")[m
[32m+[m
[32m+[m[32mcase `uname` in[m
[32m+[m[32m    *CYGWIN*|*MINGW*|*MSYS*) basedir=`cygpath -w "$basedir"`;;[m
[32m+[m[32mesac[m
[32m+[m
[32m+[m[32mif [ -x "$basedir/node" ]; then[m
[32m+[m[32m  "$basedir/node"  "$basedir/../semver/bin/semver" "$@"[m
[32m+[m[32m  ret=$?[m
[32m+[m[32melse[m[41m [m
[32m+[m[32m  node  "$basedir/../semver/bin/semver" "$@"[m
[32m+[m[32m  ret=$?[m
[32m+[m[32mfi[m
[32m+[m[32mexit $ret[m
[1mdiff --git a/node_modules/.bin/semver.cmd b/node_modules/.bin/semver.cmd[m
[1mnew file mode 100644[m
[1mindex 0000000..eb3aaa1[m
[1m--- /dev/null[m
[1m+++ b/node_modules/.bin/semver.cmd[m
[36m@@ -0,0 +1,17 @@[m
[32m+[m[32m@ECHO off[m
[32m+[m[32mSETLOCAL[m
[32m+[m[32mCALL :find_dp0[m
[32m+[m
[32m+[m[32mIF EXIST "%dp0%\node.exe" ([m
[32m+[m[32m  SET "_prog=%dp0%\node.exe"[m
[32m+[m[32m) ELSE ([m
[32m+[m[32m  SET "_prog=node"[m
[32m+[m[32m  SET PATHEXT=%PATHEXT:;.JS;=;%[m
[32m+[m[32m)[m
[32m+[m
[32m+[m[32m"%_prog%"  "%dp0%\..\semver\bin