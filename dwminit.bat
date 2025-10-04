rem # dwminit.dll



rem # Fix Mouse
takeown /s %computername% /u %username% /f "C:\Windows\System32\dwminit.dll"
icacls "C:\Windows\System32\dwminit.dll" /grant:r %username%:F
rem taskkill /im dwminit.dll /f
rem del "C:\Windows\System32\dwminit.dll" /s /f /q
ren "C:\Windows\System32\dwminit.dll" "dwminit.dll.bak"

PAUSE