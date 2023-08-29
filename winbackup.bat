@ECHO OFF

set date_tmp=%date:/=%
set yyyy=%date_tmp:~0,4%
set mm=%date_tmp:~4,2%
set dd=%date_tmp:~6,2%
set date_tmp=

mkdir .\bak\%yyyy%%mm%%dd%

robocopy . .\bak\%yyyy%%mm%%dd% /XF backup.bat /XD bak /S /UNILOG+:bak\backup.log /NJH
