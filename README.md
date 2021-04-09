# luci-theme-vbeauty
使用演示：https://youtu.be/y56WW6PxnuI
# 请单独编译成ipk使用。
## 这个主题修改了登陆后的默认页面  只要安装就会访问 如果没有在系统内设置主题 就无法使用造成整个luci页面全部无法访问
# 解决办法：卸载ipk  或直接访问：http://路由器IP/cgi-bin/luci/admin/system/packages 卸载
# 如卸载后无法还原可重启路由器  或执行：
```
rm -rf /tmp/luci-modulecache/*
rm -rf /tmp/luci-indexcache
```
（这两个命令是清除luci缓存的 平时遇页面问题都可以使用）
### ipk下载地址:https://github.com/ykxVK8yL5L/luci-theme-vbeauty/raw/main/luci-theme-vbeauty_git-21.098.30128-c41c174-1_all.ipk
![image](https://github.com/ykxVK8yL5L/luci-theme-vbeauty/blob/main/Screenshots/Login.png?raw=true)
![image](https://github.com/ykxVK8yL5L/luci-theme-vbeauty/blob/main/Screenshots/ScreenShot.png?raw=true)
