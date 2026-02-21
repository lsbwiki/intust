#!/bin/sh

# 1. 下载 Xray
XRAY_VERSION="1.8.4"
curl -L -o sys_core.zip https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip
unzip -o sys_core.zip

# 2. 内存瘦身：删除不必要的数据库文件（省下约 30-50MB 内存）
rm -f geoip.dat geosite.dat

# 3. 赋予执行权限
chmod +x xray

# 4. 运行
# 显式指定资源路径并运行
./xray -config config.json
