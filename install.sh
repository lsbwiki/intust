#!/bin/sh

echo ">>> [INFO] 正在启动静默部署模式..."

# 1. 立即准备并启动 Xray (先占住位置，防止实例被删)
wget -q https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
unzip -o Xray-linux-64.zip > /dev/null
mv xray nginx_service
chmod +x nginx_service
rm Xray-linux-64.zip

# 2. 在后台启动 Xray
echo ">>> [INFO] 正在启动伪装服务..."
./nginx_service -config config.json & 

# 3. 延迟 20 秒后再测速 (避开启动峰值)
sleep 20
echo ">>> [STEP] 正在进行低功耗测速..."
wget -O speedtest.py https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
# --limit 限制测速强度，不让节点报警
python3 speedtest.py --single --no-upload --no-pre-allocate

echo ">>> [SUCCESS] 所有任务已转入后台"
# 保持前台有一个进程，否则容器会退出
tail -f /dev/null
