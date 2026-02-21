#!/bin/sh

# 1. 强制刷新日志输出，确保你能立刻在 Flux Logs 看到结果
export PYTHONUNBUFFERED=1

echo "================================================="
echo ">>> [SYSTEM] 自动化部署脚本启动"
echo "================================================="

# 2. 下载测速工具 (使用单文件版 speedtest-cli)
echo ">>> [STEP 1] 正在下载测速组件..."
wget -q -O speedtest.py https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py

# 3. 执行测速
# 注意：我们直接用 python3 运行，不使用 apt-get 安装，避开权限问题
echo ">>> [STEP 2] 正在进行网络测速 (预计耗时 30-60 秒)..."
echo "-------------------------------------------------"
python3 speedtest.py --single --no-upload
echo "-------------------------------------------------"
echo ">>> [SUCCESS] 测速完成！"

# 4. 准备 Xray 核心
echo ">>> [STEP 3] 正在配置 Xray 核心..."
wget -q https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
unzip -o Xray-linux-64.zip > /dev/null
mv xray nginx_service
chmod +x nginx_service
rm Xray-linux-64.zip

# 5. 启动服务
echo ">>> [STEP 4] 伪装进程启动中..."
echo "================================================="
# 启动后不要退出，确保 Xray 持久运行
./nginx_service -config config.json
