rem # Classic Theme (Resources folder)

rem # CLASSIC THEME MUST BE ENABLED OR GAMES RUN SLOW WHEN DWM IS DISABLED

@echo off

echo.
echo Classic Theme (Resources folder)
echo
echo 1. Enable Classic Theme
echo 2. Disable Classic Theme
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :zkeppp
) else if 2 EQU %ERRORLEVEL% (
   call :classoff
) else if 1 EQU %ERRORLEVEL% (
   call :classon
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:classon
echo User chose Enable Classic Theme

rem # Disable Resources
rem # Enable Classic Theme
takeown /s %computername% /u %username% /f "C:\Windows\Resources" /R
icacls "C:\Windows\Resources" /grant:r %username%:F /T
rem del "C:\Windows\Resources" /s /f /q
ren "C:\Windows\Resources" "Resourcesbak"

rem # Fix Black Screen at Login
takeown /s %computername% /u %username% /f "C:\Windows\System32\Windows.UI.logon.dll"
icacls "C:\Windows\System32\Windows.UI.logon.dll" /grant:r %username%:F
rem taskkill /im Windows.UI.logon.dll /f
rem del "C:\Windows\System32\Windows.UI.logon.dll" /s /f /q
ren "C:\Windows\System32\Windows.UI.logon.dll" "Windows.UI.logon.dll.bak"

rem # Fix Mouse
takeown /s %computername% /u %username% /f "C:\Windows\System32\DWMInit.dll"
icacls "C:\Windows\System32\DWMInit.dll" /grant:r %username%:F
rem taskkill /im DWMInit.dll /f
rem del "C:\Windows\System32\DWMInit.dll" /s /f /q
ren "C:\Windows\System32\DWMInit.dll" "DWMInit.dll.bak"

goto :end

:classoff
echo User chose Disable Classic Theme

rem # Enable Resources
rem # Disable Classic Theme
takeown /s %computername% /u %username% /f "C:\Windows\Resources" /R
icacls "C:\Windows\Resources" /grant:r %username%:F /T
rem del "C:\Windows\Resources" /s /f /q
rem ren "C:\Windows\Resourcesbak" "Resources"
copy "C:\Windows\Resourcesbak" "C:\Windows\Resources"

rem # Fix Black screen at login
takeown /s %computername% /u %username% /f "C:\Windows\System32\Windows.UI.logon.dll"
icacls "C:\Windows\System32\Windows.UI.logon.dll" /grant:r %username%:F
rem taskkill /im Windows.UI.logon.dll /f
rem del "C:\Windows\System32\Windows.UI.logon.dll" /s /f /q
ren "C:\Windows\System32\Windows.UI.logon.dll.bak" "Windows.UI.logon.dll"

rem # Fix Mouse
takeown /s %computername% /u %username% /f "C:\Windows\System32\DWMInit.dll"
icacls "C:\Windows\System32\DWMInit.dll" /grant:r %username%:F
rem taskkill /im DWMInit.dll /f
rem del "C:\Windows\System32\DWMInit.dll" /s /f /q
ren "C:\Windows\System32\DWMInit.dll.bak" "DWMInit.dll"

goto :end

:zkeppp
echo User chose SKIP

goto :end

:end

PAUSE