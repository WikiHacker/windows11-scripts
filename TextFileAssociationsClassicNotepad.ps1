# Remove Default File Associations and assign Classic Notepad as default text editor

# https://github.com/timabell
# https://gist.github.com/timabell/bc90e0808ec1cda173ca09225a16e194

Remove-Item -Path "HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts" -Recurse -Force

$exts=@(
        "cfg",
        "ini",
        "log",
        "ltx",
        "txt")
echo "## setting up file associations"
foreach ($ext in $exts){
        $extfile=$ext+"file"
        $dotext="." + $ext
        cmd /c assoc $dotext=$extfile
        cmd /c "ftype $extfile=""C:\Windows\System32\notepad.exe"" ""%1"""
        echo ""
}

cmd /k 'pause'