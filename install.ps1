$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator) -ne "false") {
    Write-Warning "由于涉及到对系统盘进行操作,你需要给我管理员权限哦(不同意可以使用Ctrl+C结束程序)"
    Pause
    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process powershell -Verb runAs -ArgumentList $arguments
    exit
}
else {
    "当前处于管理员模式"
    
    #切换到脚本所在目录
    Set-Location (Split-Path -Parent $MyInvocation.MyCommand.Definition)
}

New-Variable -Name ConfigFile -Value "Aria2Config.conf" -Option Constant

#main
"欢迎进入Aria2的Windows端安装与配置程序"

$choice = Read-Host "你需要安装(y)还是卸载(n)"
if ($choice -eq "n") {
    "正在结束后台程序"
    Get-Process -Name aria2c | Stop-Process
    "正在删除文件目录"
    Remove-Item -Recurse -Force "C:\Aria2Download"
    Remove-Item -Force "$Env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\Aria2StartUp.vbs"
    "卸载完成"
    Pause
    exit
}

Start-Sleep -Seconds 1
"接下来我将引导你自定义你的下载工具"
Start-Sleep -Seconds 1

"初始化..."
#value init
$desktop = [Environment]::GetFolderPath("Desktop")

"初始化完毕..."
Write-Warning "引导时直接敲击回车键将采用默认值"
Start-Sleep -Seconds 1

$uploadlit_User = Read-Host "`n请选择你的上传速率(default:2)`n1.50KB/s`n2.100KB/s`n3.200KB/s`n4.500KB/s`n5.不限制"
switch ($uploadlit_User) {
    {$_ -eq "1"} { $uploadlit = 50 }
    {$_ -eq "2"} { $uploadlit = 100 }
    {$_ -eq "3"} { $uploadlit = 200 }
    {$_ -eq "4"} { $uploadlit = 500 }
    Default {$uploadlit = 0}
}

$downDIR = Read-Host "`n请将输入下载目录(默认D:\Downloads\)"

if ([String]::IsNullOrEmpty($downDIR)) {
    mkdir "D:\Downloads\"
    $downDIR = "D:\Downloads\"
}

"接下来生成配置文件"

$dirpath = "C:\Aria2Download"

#write config file
"daemon=true" > $ConfigFile
"enable-rpc=true" >> $ConfigFile
"rpc-allow-origin-all=true" >> $ConfigFile
"rpc-listen-all=true" >> $ConfigFile
"continue=true" >> $ConfigFile
"max-connection-per-server=5" >> $ConfigFile
"min-split-size=12M" >> $ConfigFile
"max-download-limit=0" >> $ConfigFile
"enable-mmap=true" >> $ConfigFile
"save-session-interval=60" >> $ConfigFile
"bt-tracker=udp://tracker.coppersurfer.tk:6969/announce,udp://tracker.leechers-paradise.org:6969/announce,http://tracker.internetwarriors.net:1337/announce,udp://tracker.opentrackr.org:1337/announce,udp://9.rarbg.to:2710/announce,udp://exodus.desync.com:6969/announce,udp://explodie.org:6969/announce,http://tracker3.itzmx.com:6961/announce,udp://tracker1.itzmx.com:8080/announce,udp://thetracker.org:80/announce,udp://ipv4.tracker.harry.lu:80/announce,udp://tracker.torrent.eu.org:451/announce,udp://tracker.tiny-vps.com:6969/announce,udp://tracker.port443.xyz:6969/announce,udp://tracker.cyberia.is:6969/announce,udp://open.stealth.si:80/announce,udp://open.demonii.si:1337/announce,udp://denis.stalker.upeer.me:6969/announce,udp://bt.xxx-tracker.com:2710/announce,udp://tracker4.itzmx.com:2710/announce" >> $ConfigFile
"enable-dht=true" >> $ConfigFile
"bt-enable-lpd=true" >> $ConfigFile
"enable-peer-exchange=true" >> $ConfigFile
"max-overall-upload-limit=$uploadlit" >> $ConfigFile
"dir=$downDIR" >> $ConfigFile
"save-session=$dirpath\config\aria2.session" >> $ConfigFile
"input-file=$dirpath\config\aria2.session" >> $ConfigFile
"disable-ipv6=true" >> $ConfigFile
"check-certificate=false" >> $ConfigFile
#bt downloads
"bt-max-peers=75" >> $ConfigFile
"enable-dht=true" >> $ConfigFile
"peer-id-prefix=-TR6570-" >> $ConfigFile
"user-agent=Aria2/1.34" >> $ConfigFile
"seed-ratio=1024" >> $ConfigFile
"bt-hash-check-seed=true" >> $ConfigFile
"bt-seed-unverified=true" >> $ConfigFile
"allow-piece-length-change=true" >> $ConfigFile

#convert utf-8 to ascii
#[io.file]::ReadAllText($ConfigFile, [System.Text.Encoding]::utf8) | ForEach-Object {[io.file]::WriteAllText($ConfigFile, $_, [System.Text.Encoding]::ASCII)}
./dos2unix.exe $ConfigFile

"`n正在安装程序"
mkdir "$dirpath"
mkdir "$dirpath\config"
Copy-Item –recurse -force .\AriaNG\ $dirpath\
Copy-Item -force .\sxueck-jump.ico $dirpath\
Copy-Item -force ".\aria2c.exe" $dirpath\
New-Item -ItemType file "$dirpath\config\aria2.session"
Copy-Item -force .\Aria2Config.conf "$dirpath\config\"

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($desktop + "\Aria2下载器.lnk") 
$Shortcut.TargetPath = "$dirpath\AriaNG\AriaNg.exe"
$Shortcut.IconLocation = "$dirpath\sxueck-jump.ico"
$Shortcut.Description = "我只是只小白兔"
$Shortcut.Save()

$startUp = Read-Host "`n是否设置开机启动Aria2?(y/n)"

if ($startUp -eq "y") {
    "`n正在设置开机启动项目"
    $startUpFolder = "$Env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
    "CreateObject(`"WScript.Shell`").Run `"$dirpath\aria2c.exe --conf-path=$dirpath\config\Aria2Config.conf`",0" > $dirpath\Aria2StartUp.vbs
    Copy-Item "$dirpath\Aria2StartUp.vbs" $startUpFolder
} else {
    "如你所愿"
    Start-Sleep -Seconds 1
}

Invoke-Item "$Env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

"`n配置已经完成,enjoy"
Pause