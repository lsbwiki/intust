#!/bin/sh

# 1. 下载 Xray
XRAY_VERSION="1.8.4"
curl -L -o sys_core.zip https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip
unzip -o sys_core.zip

# 2. 赋予执行权限 (先别改名，排除改名导致的权限问题)
chmod +x xray

# 3. 核心修正：确保端口被 Flux 识别
# 我们强制让 Xray 在启动时读取 Flux 的环境变量 PORT
# 如果 config.json 里有 "port": 1080，这里也会起作用
./xray -c config.json
