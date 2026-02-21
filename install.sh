#!/bin/bash

# 强制输出日志到标准输出，防止被缓冲
exec 1>&1
exec 2>&2

echo ">>> [LOG] 脚本已进入 Ubuntu 执行环境"

# 1. 检查并进入工作目录
cd /app/staging/src || cd /app

# 2. 下载 Xray (Ubuntu 默认带 wget)
echo ">>> [LOG] 下载核心组件..."
wget -q -O xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip

# 3. 解压
echo ">>> [LOG] 解压中..."
unzip -o xray.zip
chmod +x xray

# 4. 启动服务
echo ">>> [LOG] 尝试启动服务..."
# 检查 config.json 是否存在
if [ -f "config.json" ]; then
    echo ">>> [LOG] 发现配置文件，正在启动..."
    ./xray -config config.json
else
    echo ">>> [ERROR] 找不到 config.json，请检查 GitHub 仓库！"
fi
