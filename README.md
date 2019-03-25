## Aria2-Windows AutoInstall

### 提醒：你可以使用[AriaNg-Gui](https://github.com/Xmader/aria-ng-gui)项目，该项目集成了Aria2，同时更简洁

本项目用于自动化搭建Windows平台Aria2c

### 使用流程：

### 准备
从[该链接](https://github.com/sxueck/Aria2-AutoInstall/archive/master.zip)下载Aria2-WindowsClient.zip文件

**如果你找不到输入入口：可以按Win+X->Windows PowerShell(管理员)或Win+X->命令提示符(管理员)**

当你初次接触该项目时，你需要在具有管理员权限的Powershell中执行该命令
    <br/><code>Set-ExecutionPolicy -Scope CurrentUser Unrestricted</code><br/>
或者在具有管理员的命令提示符中执行
    <br/><code>powershell -Command "Set-ExecutionPolicy -Scope CurrentUser Unrestricted"</code><br/>

输入完成上面命令后，回到项目的目录，<font color="green">按住shift+鼠标右键</font>，选择"在此处打开PowerShell窗口"，输入
    <br/><code>./install.ps1</code><br/>
如果你的选项是"在此处打开命令提示符"，请输入
    <br/><code>powershell ./install.ps1</code><br/>

### 完成后
当你安装完成后，打开桌面的"Aria2下载器"快捷方式(图标是一只兔子)即可

### 高级说明
1. 如果您认为下载速度过慢，可以尝试运行trackerUpdateClient.ps1脚本更新tracker服务器地址，或者手动更改bt-tracker选项，在你安装的时候，通常会使用最新的tracker地址
2. 如果你想将本项目复制到其他计算机，请重新下载项目，否则有很大概率无法运行
3. 你也可以手动从作者的[tracker更新服务器](http://tracker.tbuu.xyz:85)中自由设置tracker列表，更新频率为[一周一次](http://tracker.tbuu.xyz:85/update.html)

### 安装浏览器支持插件
如果你是Chrome浏览器，可以访问Chrome商店安装[YAAW](https://chrome.google.com/webstore/detail/yaaw-for-chrome/dennnbdlpgjgbcjfgaohdahloollfgoc?hl=en)插件，或者使用我已经准备好的离线YAAW(YAAW-Chrome中)，[具体安装流程请看](https://blog.csdn.net/yshenhua/article/details/80901677)
