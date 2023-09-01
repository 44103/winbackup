@ECHO OFF
@setlocal enabledelayedexpansion

pushd %~dp0

set date_tmp=%date:/=%
set yyyy=%date_tmp:~0,4%
set mm=%date_tmp:~4,2%
set dd=%date_tmp:~6,2%
set date_tmp=

del .\bak\%yyyy%%mm%%dd% /Q
mkdir .\bak\%yyyy%%mm%%dd%

set ignore_files="bakignore.txt"

for /f %%a in (bakignore.txt) do (
  set tmp=%%a
  set ignore_files=!ignore_files! !tmp!
)

robocopy . .\bak\%yyyy%%mm%%dd% /XF %~nx0 %ignore_files% /XD bak /S /UNILOG+:bak\backup.log /DCOPY:T /NJH

for %%f in ("bak\%yyyy%%mm%%dd%\*.*") do (
  rename %%f %%~nf_%mm%%dd%%%~xf
)
