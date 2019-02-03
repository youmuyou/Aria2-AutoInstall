$istpath = "C:\Aria2Download"
$config = "$istpath\config\Aria2Config.conf"
$tracker = (Invoke-webrequest -URI "http://tracker.tbuu.xyz/").Content

if ([string]::IsNullOrEmpty($tracker)) {
    $tracker = Get-Content "$istpath\BackupTracker.txt"
}

Copy-Item "$istpath\config\oriAria2Config.conf" $config
"bt-tracker=$tracker" >> $config

Set-Location $istpath
./dos2unix.exe ".\config\Aria2Config.conf"
wscript.exe Aria2StartUp.vbs
