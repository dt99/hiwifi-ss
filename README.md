# hiwifi-ss

> We shall fight on the beaches.

### 安装方法

使用项目根目录下的 `shadow.sh` 脚本进行安装, 建议使用以下一键命令:

   ```sh
   curl -k -L https://raw.githubusercontent.com/dt99/hiwifi-ss/master/shadow.sh | ash
   ```

### 常见问题

0. 支持哪些加密方法？

  理论上 ss-local 3.0.8 能支持的算法都支持。

1. 安装后显示`请求的接口不存在`?

  请重启路由器. [issue#28](https://github.com/qiwihui/hiwifi-ss/issues/28)

2. 适用极路由版本有哪些?

  see [issue#38](https://github.com/qiwihui/hiwifi-ss/issues/38)

3. 如何卸载脚本?([issue#12](https://github.com/qiwihui/hiwifi-ss/issues/12))

  将`/usr/lib/lua/luci/view/admin_web/network/index.htm.ssbak` 重命名为 `/usr/lib/lua/luci/view/admin_web/network/index.htm`, 并移除ss: `opkg remove geewan-ss`

4. 如果出现类似下面的报错，请确保你是登录到极路由后台执行脚本: `ssh root@192.168.199.1 -p 1022`， 不要在自己的电脑上执行 :(

    ```sh
    x etc/: Could not remove symlink etc
    x etc/config/: Cannot extract through symlink etc
    x etc/firewall.d/: Cannot extract through symlink etc
    x etc/gw-redsocks/: Cannot extract through symlink etc
    x etc/gw-redsocks.conf: Cannot extract through symlink etc
    x etc/gw-shadowsocks/: Cannot extract through symlink etc
    x etc/init.d/: Cannot extract through symlink etc
    x etc/rc.d/: Cannot extract through symlink etc
    x etc/ss/: Cannot extract through symlink etc
    ......
    ```

5. 项目如何开机自动运行？

  项目在 `/etc/rc.d/` 下添加了 `S99gw-shadowsocks` 指向 `/etc/init.d/gw-shadowsocks`，所以会开机自动运行的。

### TODO


### 贡献

1. 如果你在使用中有什么问题或者建议，请不要吝啬，给我提一个issue;
2. 如果你对代码有自己的想法并实现了，请给我一个Pull Request;
3. 不接收邮件了，问题大家都应该看到，这样减少重复回答，请提issue，谢谢～

### 目前状态

1. 新版界面

(1). ss账号设置

  ![](./ss-settings.png)

