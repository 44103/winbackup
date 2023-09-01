@echo off
@setlocal enabledelayedexpansion

pushd %~dp0

set date_tmp=%date:/=%
set yyyy=%date_tmp:~0,4%
set mm=%date_tmp:~4,2%
set dd=%date_tmp:~6,2%
set date_tmp=

del .\bak\%yyyy%%mm%%dd% /Q
mkdir .\bak\%yyyy%%mm%%dd%

set "ignore_files=%~nx0 bakignore.txt"
set "ignore_dirs=bak/"

for /f %%a in (bakignore.txt) do (
  set tmp=%%a
  echo !tmp! | find "/" > nul
  if errorlevel 1 (
    set ignore_files=!ignore_files! !tmp!
  ) else (
    set ignore_dirs=!ignore_dirs! !tmp!
  )
)

robocopy . .\bak\%yyyy%%mm%%dd% /XF %ignore_files% /XD %ignore_dirs:/=% /S /UNILOG+:bak\backup.log /DCOPY:T /NJH

for %%f in ("bak\%yyyy%%mm%%dd%\*.*") do (
  rename %%f %%~nf_%mm%%dd%%%~xf
)
