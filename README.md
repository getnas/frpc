# FRP 客户端
该容器仅适用于 x86_64 架构使用。

此为 FRP 客户端，即 frpc 部分，部署在有服务需要穿透的设备上。

### Quick Start

在当前目录创建 `frpc` 文件夹和 `frpc/frpc.ini` 配置文件，填上以下内容以及其他你需要的 frpc 配置：

```
[common]
server_addr = {{ .Envs.FRP_SERVER }}
server_port = {{ .Envs.FRP_PORT }}
token = {{ .Envs.FRP_TOKEN }}

# 以下配置根据实际需要填写
[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 6556
```

请将命令中 `<>` 部分替换成实际的内容，实际的内容不要带这个尖角括号。

```shell
$ sudo docker run -d --name frpc \
-e FRP_SERVER=<1.2.3.4> \
-e FRP_PORT=<7000> \
-e FRP_TOKEN=<abcdefg> \
-v $PWD/frpc:/etc/frp \
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