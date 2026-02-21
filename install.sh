#!/bin/sh

echo "------------------------------------------------"
echo "正在执行 Flux 节点机器测速..."
echo "------------------------------------------------"

# 运行测速
wget -qO- https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -

echo "------------------------------------------------"
echo "测速完成，启动 Xray (UUID: 535a6590...)"
echo "------------------------------------------------"

# 启动服务
exec xray -config /etc/xray/config.json
