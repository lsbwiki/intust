#!/bin/sh

# 1. 自动根据系统安装 curl 和 unzip (防止 Flux 镜像太精简)
if [ -f /usr/bin/apt ]; then
    apt-get update && apt-get install -y curl unzip
elif [ -f /sbin/apk ]; then
    apk add curl unzip
fi

# 2. 下载并解压 Xray
XRAY_VERSION="1.8.4"
curl -L -o sys_core.zip https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip
unzip -o sys_core.zip

# 3. 赋予执行权限 (非常重要)
chmod +x xray

# 4. 检查配置文件是否存在
if [ ! -f "config.json" ]; then
    echo "错误：找不到 config.json 文件！"
    exit 1
fi

# 5. 启动 Xray
echo "Xray 正在启动，监听端口: 1080..."
./xray -config config.json
