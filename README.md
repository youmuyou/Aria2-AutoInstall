## Aria2-Windows AutoInstall

本项目用于自动化搭建Windows平台Aria2c

### 使用流程：

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

### 安装浏览器支持插件
如果你是Chrome浏览器，可以访问Chrome商店安装[YAAW](https://chrome.google.com/webstore/detail/yaaw-for-chrome/dennnbdlpgjgbcjfgaohdahloollfgoc?hl=en)插件，或者使用我已经准备好的离线YAAW(YAAW-Chrome中)，[具体安装流程请看](https://blog.csdn.net/yshenhua/article/details/80901677)