#!/bin/bash

# 1. 自动识别包管理器并安装必要组件 (curl, unzip, python3)
echo "--- 正在初始化系统环境 ---"
if [ -f /usr/bin/apt ]; then
    apt-get update && apt-get install -y curl unzip python3
elif [ -f /sbin/apk ]; then
    apk add --no-cache curl unzip python3 bash
fi

# 2. 网速测试环节
echo "--- 正在开始网速测试 (Speedtest) ---"
# 即使没有安装 speedtest-cli，也可以通过这个单行命令直接跑
curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
echo "--- 网速测试完成 ---"

# 3. 下载并安装 Xray 核心
# 使用最新版本或指定版本
XRAY_VERSION="1.8.4"
echo "--- 正在下载 Xray v${XRAY_VERSION} ---"
curl -L -o xray.zip "https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip"

# 解压并赋予权限
echo "--- 正在解压并配置权限 ---"
unzip -o xray.zip
chmod +x xray
chmod +x ./xray

# 4. 验证配置文件是否存在
if [ ! -f "config.json" ]; then
    echo "错误: 未找到 config.json 配置文件！"
    exit 1
fi

# 5. 启动 Xray 服务
# 注意：千万不要在末尾加 &，必须让它在前台运行以保持容器存活
echo "--- Xray 服务启动中... ---"
./xray -config config.json
