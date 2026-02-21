#!/bin/sh

# 1. 安装基础工具 (Orbit 通常基于 Debian)
echo "Installing dependencies..."
apt-get update && apt-get install -y wget unzip python3

# 2. 运行测速
echo "Running Speedtest..."
wget -qO- https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -

# 3. 下载并准备 Xray
echo "Downloading Xray..."
wget -q https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
unzip -o Xray-linux-64.zip
chmod +x xray

# 4. 启动服务
echo "Starting Xray..."
./xray -config config.json
