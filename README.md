### Aria2-Windows AutoInstall

本项目用于自动化搭建Windows平台Aria2c

## 使用流程：

当你初次接触该项目时，你需要在具有管理员权限的Powershell中执行该命令
    <code>Set-ExecutionPolicy -Scope CurrentUser Unrestricted</code>
或者在具有管理员的命令提示符中执行
    <code>powershell -Command "Set-ExecutionPolicy -Scope CurrentUser Unrestricted"</code>

**如果你找不到输入入口：可以按Win+X->Windows PowerShell(管理员)或Win+X->命令提示符(管理员)**

输入完成上面命令后，回到项目的目录，按住shift+鼠标右键，选择"在此处打开PowerShell窗口"，输入
    <code>./install.ps1</code>
同样输入你的选项是"在此处打开命令提示符"，请输入
    <code>powershell ./install.ps1</code>

接下来按照指示完成即可

## 最后步骤
当你安装完成后，打开桌面的"Aria2下载器"快捷方式(图标是一只兔子)
接下来点击 设置->连接设置，在"密码令牌（可选）"粘贴你的密码，看到"通过 RPC 连接到 Aria2 成功！"代表完成安装