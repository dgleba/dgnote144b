:Prepare date and temp folders
set ymd=%date:~12,2%%date:~4,2%%date:~7,2%&set dhms=%date:~12,2%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
:c: & md c:\temp\ & cd c:\temp & md c:\temp\log & md c:\temp\log\"%dhms%"  & cd c:\temp\log\"%dhms%"
c: & md c:\temp\ &  md c:\temp\log & md c:\temp\log\"%dhms%"  
:main
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ cap

:apps
echo............testcopy...  /l ...

call rbc-repogit1.bat dgnote144b

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ cap














:..........---- offline items................................................
goto end
goto end
goto end
goto :end
:#######

PING 127.0.0.1 -n 6 >NUL

:#######
:end
timeout 99