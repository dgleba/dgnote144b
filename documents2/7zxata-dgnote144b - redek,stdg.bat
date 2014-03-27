set ymd=%date:~12,2%%date:~4,2%%date:~7,2%&set dhms=%date:~12,2%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
c: & md c:\temp\ & cd c:\temp & md c:\temp\log & md c:\temp\log\"%dhms%"  & cd c:\temp\log\"%dhms%"
:main
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 7

:mkdir c:\backup\dgnote130
:echo ran,7zxata-dgnote144-1,%computername%,"%dhms%" >> C:\p2\xampp\htdocs\dgnote130\documents\bkuplogs\7zxata-dgnote130-runlog.%computername%.csv

:robocopy C:\p2\xampp\htdocs\dgnote130 C:\n\Dropbox\csd\crepo\dgnote130\%computername%  /e /xd templates_c\ nbproject .svn\ /fft /dst /xo /ndl /np /r:0 /w:0 /tee /eta /log:"c:rb-130cn-%computername%,%dhms%"
:robocopy C:\p2\xampp\htdocs\dgnote130 C:\n\Dropbox\csd\crepo\dgnote130\master /e  /xd templates_c\ nbproject .svn /dst /fft /xo /ndl /np /r:0 /w:0 /tee /eta /log:"c:rb-130m-%computername%,%dhms%"
:copy "c:rb-130m-%dhms%" C:\p2\xampp\htdocs\dgnote130\documents\bklogs-rb

:only my files... exclude xataface and modules
C:\p\1ziptar\7-Zip\7z.exe a -y -t7z  -xr!templates_c -xr!.svn  "c:\backup\dgnote144b\dgnote144b.xata.%dhms%.%computername%.7z" C:\p2\xampp\htdocs\dgnote144b 
copy "c:\backup\dgnote144b\dgnote144b.xata.%dhms%.%computername%.7z" "C:\n\Dropbox\csd\copyof\dgnote130,tagger\dgnote144b.xata.latest.%computername%.7z"

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 7














:..........---- offline items................................................
goto end
goto end
goto end
:#######

goto :end

full folder
del "c:\backup\prodrpt\prodrpt.full.xata.%ymd%.7z"
C:\p\1ziptar\7-Zip\7z.exe  a -y -t7z -xr!templates_c "c:\backup\prodrpt\prodrpt.full.xata.%ymd%.7z"  C:\p2\xampp\htdocs\prodrpt 

:skip1
:delete-uneeded then copy only date range
rmdir c:\temp\tmp\prodrpt  /s /q & mkdir c:\temp\tmp\prodrpt   
xcopy  C:\p2\xampp\htdocs\prodrpt\*.* c:\temp\tmp\prodrpt  /s/h/i/f/c/k/y /d:03-20-2013
C:\p\1ziptar\7-Zip\7z.exe  a -y -t7z -xr!templates_c -xr!xataface "c:\backup\prodrpt\prodrpt.after320.xata.%dhms%.7z"  c:\temp\tmp\prodrpt 

:delete-uneeded then copy only x days old
rmdir c:\temp\tmp\prodrpt  /s /q 
robocopy C:\p2\xampp\htdocs\prodrpt  c:\temp\tmp\prodrpt /xd "templates_c"  /maxage:1 /s /ndl /ts /np /fft /dst  /r:0 /w:9 /tee /log:"c:rb-prdt-%dhms%-%random%"
C:\p\1ziptar\7-Zip\7z.exe  a -y -t7z "c:\backup\prodrpt\prodrpt.2days.xata.%dhms%.7z"  c:\temp\tmp\prodrpt 

PING 127.0.0.1 -n 6 >NUL
: std robocopy s:\qems z:\xf1\s-cpy\qems        /mir    /XD video /xd software  /fft /dst /xo /ndl /np /r:0 /w:9 /tee /log:"c:rb-s,tos7-%dhms%-%random%%random%"
: std xcopy  h:\*.* e:\0\n\backupsdcard\*.* /s/e/d/h/i/f/c/k/y
: std C:\p\1ziptar\7-Zip\7z.exe  a -y -tzip -xr!templates_c "c:\backup\prodrpt132t\prodrpt132t.xata.%dhms%.7z.zip"  C:\p2\xampp\htdocs\prodrpt132t 
robocopy C:\p2\xampp\htdocs\prodrpt132t  c:\temp\tmp\prodrpt132t /xd "templates_c"  /maxage:2 /s /ndl /ts /np /fft /dst  /r:0 /w:9 /tee /log:"c:rb-prdt-%dhms%-%random%"
:full folder
C:\p\1ziptar\7-Zip\7z.exe  a -y -tzip -xr!templates_c "c:\backup\prodrpt132t\prodrpt132t.xata.%ymd%.7z.zip"  C:\p2\xampp\htdocs\prodrpt132t 

to exclude modules...
C:\p\1ziptar\7-Zip\7z.exe a -y -t7z -xr!xataface -xr!templates_c -xr!modules "c:\backup\dgnote130\dgnote130.xata.%dhms%.%computername%.7z" C:\p2\xampp\htdocs\dgnote130 

:#######
:end
pause