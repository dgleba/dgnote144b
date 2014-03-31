:Prepare date and temp folders
set ymd=%date:~12,2%%date:~4,2%%date:~7,2%&set dhms=%date:~12,2%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
c: & md c:\temp\ & cd c:\temp & md c:\temp\log & md c:\temp\log\"%dhms%"  & cd c:\temp\log\"%dhms%"
:check if parameter missing
if [%1]==[] goto usage
@echo using %1
@echo 
goto :main
:usage
@echo Usage: %0 ^<EnvironmentName^>
timeout 12
:exit so the file won't execute with no parameters.
exit /B 1
:main
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ cap

:apps
echo............testcopy...  /l ...

robocopy   C:\p2\xampp\htdocs\0\%1 C:\p2\xampp\htdocs\%1    /e /xd templates_c\ .svn\ /XD .hg /XD .git /l  /fft /dst /xo /ndl /np /r:0 /w:9 /tee /log:"c:rb,git1-%dhms%-%random%"

timeout 49

:robocopy   C:\p2\xampp\htdocs\0\%1 C:\p2\xampp\htdocs\%1    /e /xd templates_c\ .svn\ /XD .hg /XD .git   /fft /dst /xo /ndl /np /r:0 /w:9 /tee /log:"c:rb,git1-%dhms%-%random%"


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