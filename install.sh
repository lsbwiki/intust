#!/bin/sh

echo "------------------------------------------------"
echo "Step 1: 正在安装测速环境 (Python3 & Wget)..."
echo "------------------------------------------------"

# 因为 Orbit 环境通常是 Alpine，使用 apk 安装依赖
apk update && apk add --no-cache python3 wget

echo "------------------------------------------------"
echo "Step 2: 正在执行机器网络测速..."
echo "------------------------------------------------"

# 运行测速
wget -qO- https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -

echo "------------------------------------------------"
echo "Step 3: 正在从二进制安装 Xray..."
echo "------------------------------------------------"

# 下载官方 Xray 核心 (因为 Orbit 环境里没有 xray)
wget -q https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
unzip -o Xray-linux-64.zip
chmod +x xray

echo "------------------------------------------------"
echo "Step 4: 启动 Xray 服务..."
echo "------------------------------------------------"

# 使用仓库里的 config.json 启动
./xray -config config.json
