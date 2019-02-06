$istpath = Replace
$config = "$istpath\config\Aria2Config.conf"
$tracker = (Invoke-webrequest -URI "http://tracker.tbuu.xyz:85/").Content

if ([string]::IsNullOrEmpty($tracker)) {
    $tracker = Get-Content "$istpath\BackupTracker.txt"
}

Copy-Item "$istpath\config\oriAria2Config.conf" $config
"bt-tracker=$tracker" >> $config

Set-Location $istpath
./dos2unix.exe ".\config\Aria2Config.conf"