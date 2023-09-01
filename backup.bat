@echo off
@setlocal enabledelayedexpansion

pushd %~dp0

set vartmp=%date:/=%
set yyyy=%vartmp:~0,4%
set mm=%vartmp:~4,2%
set dd=%vartmp:~6,2%

del .\bak\%yyyy%%mm%%dd% /Q
mkdir .\bak\%yyyy%%mm%%dd%

set "ignore_files=%~nx0 bakignore.txt"
set "ignore_dirs=bak/"

for /f %%a in (bakignore.txt) do (
  set vartmp=%%a
  echo !vartmp! | find "/" > nul
  if errorlevel 1 (
    set ignore_files=!ignore_files! !vartmp!
  ) else (
    set ignore_dirs=!ignore_dirs! !vartmp!
  )
)

robocopy . .\bak\%yyyy%%mm%%dd% /XF %ignore_files% /XD %ignore_dirs:/=% /S /UNILOG+:bak\backup.log /DCOPY:T /NJH

for %%f in ("bak\%yyyy%%mm%%dd%\*.*") do (
  rename %%f %%~nf_%mm%%dd%%%~xf
)
