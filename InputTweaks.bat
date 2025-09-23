rem # !!!WARNING!!!
rem # VALUES NEED ADJUSTED TO MATCH USER HARDWARE
rem # !!!WARNING!!!

PAUSE

rem # https://www.clickspeedtester.com/keyboard-latency-test/

PAUSE

rem # Enable NumLock at startup (0 = Disabled / 2 = Enable)
reg add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_DWORD /d "2" /f

rem # Disable BSOD Hotkey (CTRL+ScrollLock twice)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" /v "CrashOnCtrlScroll" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdhid\Parameters" /v "CrashOnCtrlScroll" /t REG_DWORD /d "0" /f

rem # Repeat Rate
rem # May increase latency if 1+
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "KeyboardSpeed" /t REG_DWORD /d "0" /f

rem # Repeat Delay
rem # May increase latency if 1+
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Keyboard" /v "TypematicDelay" /t REG_DWORD /d "0" /f

rem # May increase latency when 1+
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatDelay" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatRate" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "DelayBeforeAcceptance" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "BounceTime" /t REG_SZ /d "0" /f

rem # Mouse Human Interface Device tweaks
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "TreatAbsolutePointerAsAbsolute" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "TreatAbsoluteAsRelative" /t REG_DWORD /d "0" /f

rem # Fastest cursor update rate
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "CursorUpdateInterval" /t REG_DWORD /d "1" /f

rem # Mouse Cursor Tweaks
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "AttractionRectInsetInDIPS" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "DistanceThresholdInDIPS" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "MagnetismDelayInMilliseconds" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "MagnetismUpdateIntervalInMilliseconds" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "VelocityInDIPSPerSecond" /t REG_DWORD /d "0" /f

reg add "HKCU\Control Panel\Mouse" /v "ActiveWindowTracking" /t REG_DWORD /d "0" /f



reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "SendOutputToAllPorts" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "SendOutputToAllPorts" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "WppRecorder_UseTimeStamp" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdhid\Parameters" /v "WppRecorder_UseTimeStamp" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "WppRecorder_UseTimeStamp" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "WppRecorder_UseTimeStamp" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "ConnectMultiplePorts" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "ConnectMultiplePorts" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "MaximumPortsServiced" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MaximumPortsServiced" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardTransmitTimeout" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseTransmitTimeout" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "LayeredLatency" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "LayeredLatency" /t REG_DWORD /d "0" /f

rem # Values too low cause mouse glitches/skipping and unregistered keyboard presses
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardReportBufferCount" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseReportBufferCount" /t REG_DWORD /d "1" /f

setx MOUSE_RAW_INPUT "1" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "MOUSE_RAW_INPUT" /t REG_SZ /d "1" /f

setx KEYBOARD_FAST_INIT "1" /M
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "KEYBOARD_FAST_INIT" /t REG_SZ /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "LayeredLatency" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "UseOnlyMice" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "WorkNicely" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\Input" /v "AllowRawInputExclusive" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Input" /v "EnableRawInputHighPriority" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Keyboard" /v "ClearInputBufferOnFocusChange" /t REG_DWORD /d "0" /f

rem # alufena = 0
rem # NON-USB MICE
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass" /v "PollingInterval" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "CustomUsbHidPollingRate" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "DeviceIdleEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "DeviceSelectiveSuspended" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "DisableDebouncing" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "DisableIdleTimer" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "DisableRemoteWake" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "DisableSelectiveSuspend" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "DisableWakeFromSuspend" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "ForceLowestInputLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "ForceLowLatencyMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "IdleEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "IdleTimeout" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "InterruptCoalescingEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "InterruptLatencyOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "LowLatencyMode" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "SelectiveSuspendEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "UseUsbHidPollingRate" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" /v "DisableInputBuffering" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" /v "ForceImmediateInputProcessing" /t REG_DWORD /d "1" /f

rem # alufena = 0
reg add "HKLM\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" /v "Headless" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" /v "IncreaseKeyboardPollingRate" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" /v "OverrideKeyboardType" /t REG_DWORD /d "1" /f

rem # alufena = 1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" /v "PollingIterations" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" /v "PollStatusIterations" /t REG_DWORD /d "1" /f



rem # DataQueueSize
rem # Mouse and keyboard buffer sizes
rem # Values too low cause mouse glitches/skipping and unregistered keyboard presses
rem # Values under 16 (0x00000016) require very good hardware

@echo off



echo.
echo DataQueueSize
echo Mouse and keyboard buffer sizes
echo.
echo 1. 0x00000016 (RECOMMENDED)
echo 2. 0x00000012
echo 3. 0x00000008
echo 4. 0x00000004
echo 5. 0x00000002
echo 6. 0x00000001 (VERY FAST COMPUTER)
echo 7. DEFAULT
echo 8. SKIP
echo C. Cancel
echo.
choice /c 12345678C /m "Choose an option :"

if 9 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 8 EQU %ERRORLEVEL% (
   call :zzkiiipheh
) else if 7 EQU %ERRORLEVEL% (
   call :qd
) else if 6 EQU %ERRORLEVEL% (
   call :q1
) else if 5 EQU %ERRORLEVEL% (
   call :q2
) else if 4 EQU %ERRORLEVEL% (
   call :q4
) else if 3 EQU %ERRORLEVEL% (
   call :q8
) else if 2 EQU %ERRORLEVEL% (
   call :q12
) else if 1 EQU %ERRORLEVEL% (
   call :q16
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:q16
echo User chose 0x00000016 (RECOMMENDED)

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x00000016" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x00000016" /f

goto :end

:q12
echo User chose 0x00000012

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x00000012" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x00000012" /f

goto :end

:q8
echo User chose 0x00000008

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x00000008" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x00000008" /f

goto :end

:q4
echo User chose 0x00000004

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x00000004" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x00000004" /f

goto :end

:q2
echo User chose 0x00000002

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x00000002" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x00000002" /f

goto :end

:q1
echo User chose 0x00000001 (VERY FAST COMPUTER)

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x00000001" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x00000001" /f

goto :end

:qd
echo User chose DEFAULT

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /f

goto :end

:zzkiiipheh
echo User chose SKIP

goto :end

:end



echo.
echo USB Polling Rate
echo.
echo 1. 500Hz
echo 2. 1000Hz
echo 3. SKIP
echo C. Cancel
echo.
choice /c 1234C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :naw
) else if 2 EQU %ERRORLEVEL% (
   call :1000
) else if 1 EQU %ERRORLEVEL% (
   call :500
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:500
echo User chose 500Hz

rem # 500MHz = 0x000001f4 (500)
rem # 1000MHz = 0x000003e8 (1000)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "PollingRate" /t REG_DWORD /d "0x000001f4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "PollingRateOverride" /t REG_DWORD /d "0x000001f4" /f

goto :end

:500
echo User chose 1000Hz

rem # 500MHz = 0x000001f4 (500)
rem # 1000MHz = 0x000003e8 (1000)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "PollingRate" /t REG_DWORD /d "0x000003e8" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters" /v "PollingRateOverride" /t REG_DWORD /d "0x000003e8" /f

goto :end

:naw
echo User chose SKIP

goto :end

:end

PAUSE
