# FRP 客户端
该容器仅适用于 x86_64 架构使用。

此为 FRP 客户端，即 frpc 部分，部署在有服务需要穿透的设备上。

### Quick Start

```shell
$ sudo docker run -d --name fprc \
-e FRP_SERVER=<1.2.3.4> \
-e FRP_PORT=<7000> \
-e FRP_TOKEN=<abcdefg> \
-p <7000>:<7000> \
-p <$HOME/frp>:/etc/frp \
--network=host \
--restart=unless-stopped \
getnas/frpc
```

### 环境变量

- `FRP_SERVER` frp 服务器IP
- `FRP_PORT` frp 服务器端口
- `FRP_TOKEN` 密码

### 注意

容器的网络类型应设置为 `--network=host`