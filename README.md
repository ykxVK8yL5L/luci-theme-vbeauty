# luci-theme-vbeauty
使用演示：https://youtu.be/y56WW6PxnuI
# 实测在Ipad air上有些页面出现卡死及乱跳  原因未知 可能为js导致的页面不稳定  pc和手机端正常 老旧设备请勿使用
# UCI命令限制  保存数据不要有空格
~~# 请单独编译成ipk使用。~~
~~## 这个主题修改了登陆后的默认页面  只要安装就会访问 如果没有在系统内设置主题 就无法使用造成整个luci页面全部无法访问~~
~~# 解决办法：卸载ipk  或直接访问：http://路由器IP/cgi-bin/luci/admin/system/packages 卸载~~
# 不设置主题也可使用 但是最好设置主题以优化体验
# 如卸载后无法还原可重启路由器  或执行：
```
rm -rf /tmp/luci-modulecache/*
rm -rf /tmp/luci-indexcache
```
（这两个命令是清除luci缓存的 平时遇页面问题都可以使用）
![image](https://github.com/ykxVK8yL5L/luci-theme-vbeauty/blob/main/Screenshots/Login.png?raw=true)
![image](https://github.com/ykxVK8yL5L/luci-theme-vbeauty/blob/main/Screenshots/ScreenShot.png?raw=true)
