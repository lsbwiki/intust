#!/bin/sh

# 1. 下载最新 Xray (支持 Reality 协议)
XRAY_VERSION="1.8.4"
curl -L -o sys_core.zip https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip
unzip -o sys_core.zip

# 2. 伪装二进制文件名，改变特征
mv xray system_monitor
chmod +x system_monitor
rm -f sys_core.zip

# 3. 启动
./system_monitor -c config.json
