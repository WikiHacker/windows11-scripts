rem # Enable Fullscreen Optimizations (FSO)

rem # https://learn.microsoft.com/en-us/answers/questions/3741077/fullscreen-optimizations-windows-registry?forum=windows-all&referrer=answers

rem # https://en.ittrip.xyz/windows10/registry-tweaks-gamedvr#google_vignette

rem # https://youtu.be/JUXEr5QsaCc?si

rem # DirectX 12 Ultimate (12_2) requires GeForce RTX 20/30 or newer and Radeon RX 6000 or newer

rem # Check MPO support using DXDiag > "Save All Information" and looking in DxDiag.txt file
rem # MPO MaxPlanes should be 1+ if MPO is enabled
rem # MPO Caps, MPO Stretch, MPO Media Hints, MPO Formats, PanelFitter Caps, and PanelFitter Stretch will say "Not Supported" if MPO is disabled

rem # Check Flip Mode with PresentMon
rem # https://github.com/GameTechDev/PresentMon

rem # https://wiki.special-k.info/Presentation_Model

rem # Enable and start WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt

rem # https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/gpu-tweaks-batch-script.30134/post-521530
if not exist C:\Windows\System32\wbem\WMIC.exe (
    echo Installing WMIC...
    DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
    echo Done.
)



rem # Fullscreen Exclusive (FSE)
rem # Enhanced Fullscreen Exclusive (EFSE)
rem # Desktop Screen Experience (DSE) = scenario where you're not strictly in a fullscreen game but may still be capturing or recording
rem # Multiplane Overlay (MPO)

rem # Enable FSO and EFSE
rem # 0 = FSO/EFSE: ON / FSE: ON
rem # 2 = FSO/EFSE: OFF / FSE: ON
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "0" /f

rem # 0 = Applies GameDVR_FSEBehavior to games marked as "High Impact"
rem # 1 = Applies GameDVR_FSEBehavior to all fullscreen games
rem # 2 = DISABLE FSO/EFSE
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "1" /f

rem # Honor User adjusted FSE value
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f



rem # Enable more FSO features
rem # Enable Color Management
rem # Enable GameDVR recording
rem # 0 = Enable More FSO Features / 1 = Disable FSO Features
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "0" /f

rem # Controls resource usage for Desktop Screen Experience (DSE)
rem # GameDVR uses system resources for recording and broadcasting while in DSE
rem # ON = 0 / Unrestricted resource usage for capturing
rem # OFF = 2 / Limits resource usage for capturing
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "0" /f

rem reg add "HKCU\System\GameConfigStore" /v "GameDVR_DSEBehaviorMode" /t REG_DWORD /d "1" /f

rem # Honor User adjusted DSE value
rem reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserDSEBehaviorMode" /t REG_DWORD /d "1" /f

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DisableFullScreenOptimizations" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "FORCE_DISABLE_FULL_SCREEN_OPTIMIZATIONS" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "DisableFullScreenOptimizations" /t REG_DWORD /d "0" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "FORCE_DISABLE_FULL_SCREEN_OPTIMIZATIONS" /t REG_SZ /d "0" /f



rem # MPO and FSO NEED TO BE ENABLED FOR "HARDWARE COMPOSED: INDEPENDENT FLIP"

rem # "Hardware Composed: Independent Flip" = rendering buffer is directly scanned out to the display, bypassing the Desktop Window Manager (DWM) composition for improved performance

rem # "Hardware: Legacy Flip" used when FSO is DISABLED

rem # Enable Multiplane Overlay (MPO)
reg delete "HKLM\SYSTEM" /v "OverlayTestMode" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "OverlayTestMode" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayTestMode" /f



@echo off



echo.
echo HDR (High Dynamic Range)
echo.
echo 1. HDR ON (AutoHDR=1 / SwapEffectUpgrade=1)
echo 2. HDR OFF (AutoHDR=0 / SwapEffectUpgrade=1)
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :sccipp
) else if 2 EQU %ERRORLEVEL% (
   call :hdrofff
) else if 1 EQU %ERRORLEVEL% (
   call :fsoon
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:fsoon
echo User chose HDR ON (AutoHDR=1 / SwapEffectUpgrade=1)



rem # Enable Enhanced Fullscreen Exclusive (EFSE)

rem # Bit 0: Toggles EFSE mode support (1 = ENABLED / 0 = DISABLED)
rem # Bit 1: Toggles DXGI swap chain flip model support (lower latency when enabled)
rem # Bit 2: Toggles DXGI swap chain scaling support (DISABLE)
rem # Bit 3: Toggles DXGI swap chain color space support (required for HDR)
rem # Bit 4: Toggles DXGI swap chain HDR metadata support (required for HDR)
rem # Bit 5: Toggles DXGI swap chain overlay support (FPS DROP WHEN ENABLED)

rem # 0 / 00000000 = Disable EFSE
rem # 0x01 / 00000001 = Enable ONLY EFSE
rem # 0x03 / 00000011 = Enable EFSE + Flip Model
rem # 0x07 / 00000111 = Enable EFSE + Flip Model + Scaling
rem # 0xf / 00001111 = Enable EFSE + Flip Model + Scaling + Color Space
rem # 0x1f / 00011111 = Enable EFSE + Flip Model + Scaling + Color Space + HDR metadata
rem # 0x3f / 00111111 = Enable EFSE + Flip Model + Scaling + Color Space + HDR metadata + Overlay (FPS DROP)
rem # 0x3b / 00111011 = Enable EFSE + Flip Model + Color Space + HDR metadata + Overlay (FPS DROP)
rem # 0x1b / 00011011 = Enable EFSE + Flip Model + Color Space + HDR metadata

reg add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0x1b" /f



call EnableHDR.bat
cd "%~dp0"

goto :end

:hdrofff
echo User chose HDR OFF (AutoHDR=0 / SwapEffectUpgrade=1)



rem # Enable Enhanced Fullscreen Exclusive (EFSE)

rem # Bit 0: Toggles EFSE mode support (1 = ENABLED / 0 = DISABLED)
rem # Bit 1: Toggles DXGI swap chain flip model support (lower latency when enabled)
rem # Bit 2: Toggles DXGI swap chain scaling support (DISABLE)
rem # Bit 3: Toggles DXGI swap chain color space support (required for HDR)
rem # Bit 4: Toggles DXGI swap chain HDR metadata support (required for HDR)
rem # Bit 5: Toggles DXGI swap chain overlay support (FPS DROP WHEN ENABLED)

rem # 0 / 00000000 = Disable EFSE
rem # 0x01 / 00000001 = Enable ONLY EFSE
rem # 0x03 / 00000011 = Enable EFSE + Flip Model
rem # 0x07 / 00000111 = Enable EFSE + Flip Model + Scaling
rem # 0xf / 00001111 = Enable EFSE + Flip Model + Scaling + Color Space
rem # 0x1f / 00011111 = Enable EFSE + Flip Model + Scaling + Color Space + HDR metadata
rem # 0x3f / 00111111 = Enable EFSE + Flip Model + Scaling + Color Space + HDR metadata + Overlay (FPS DROP)
rem # 0x3b / 00111011 = Enable EFSE + Flip Model + Color Space + HDR metadata + Overlay (FPS DROP)
rem # 0x1b / 00011011 = Enable EFSE + Flip Model + Color Space + HDR metadata

reg add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0x03" /f



call EnableSwapEffectUpgrade.bat
cd "%~dp0"

goto :end

:sccipp
echo User chose SKIP

goto :end

:end



echo.
echo
echo.
echo 1. Enable AMD SwapEffect (DXGI_SWAP_EFFECT_FLIP_DISCARD)
echo 2. SKIP
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :sccippl
) else if 1 EQU %ERRORLEVEL% (
   call :amdswap
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:amdswap
echo User chose Enable AMD SwapEffect (DXGI_SWAP_EFFECT_FLIP_DISCARD)

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
        for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%i" /v "Driver"') do (
                for /f %%i in ('echo %%a ^| findstr "{"') do (

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect" /t REG_BINARY /d "3100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_DEF" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect" /t REG_BINARY /d "3100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_DEF" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_D3D" /t REG_BINARY /d "3100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_D3D_DEF" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_D3D_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_D3D" /t REG_BINARY /d "3100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_D3D_DEF" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_D3D_NA" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_OGL" /t REG_BINARY /d "3100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_OGL_DEF" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i" /v "Swapeffect_OGL_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_OGL" /t REG_BINARY /d "3100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_OGL_DEF" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%i\UMD" /v "Swapeffect_OGL_NA" /t REG_SZ /d "0" /f

)
)
)

goto :end

:sccippl
echo User chose SKIP

goto :end

:end

PAUSE