#!/bin/sh

echo "------------------------------------------------"
echo "正在执行 Flux 节点机器测速..."
echo "------------------------------------------------"

# 运行测速
wget -qO- https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -

echo "------------------------------------------------"
echo "测速完成，正在以写死配置启动 Xray..."
echo "------------------------------------------------"

# 直接启动，不再使用 sed 替换
exec xray -config /etc/xray/config.json
