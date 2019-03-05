## Aria2-AutoInstall TrackerUpdate Server
这是用于你自己搭建tracker更新服务器的一个脚本

***建议操作平台***
1. Ubuntu 14.04+
2. CentOS 7+

### 流程
<code>chmod +x AutoGetTrackerServer && ./AutoGetTrackerServer</code>
<br><code>sudo mv AutoGetTrackerServer /etc/cron.weekly</code>

### 提示
1. 一般来说，系统默认更新为周日(UTC +8:00)，或者你也可以把脚本放入/etc/cron.monthly(更新周期为每月一次)
2. 请自己从脚本修改网站根目录(默认为Apache2)