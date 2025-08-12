rem # AMD Adrenalin VSYNC Enabled

rem # SET MONITOR REFRESH RATE TO 60Hz TO FIX BUGGY GAMES

rem # Enable and start WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

rem # 0 = Always Off / 3 = Dynamic VSync / 4 = Always On
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VSyncControl" /t REG_BINARY /d "3400" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VSyncControl_DEF" /t REG_SZ /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "VSyncControl_NA" /t REG_SZ /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "VSyncControl" /t REG_BINARY /d "3400" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "VSyncControl_NA" /t REG_SZ /d "4" /f

)
)
)

PAUSE