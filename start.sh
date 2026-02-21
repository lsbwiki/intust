#!/bin/sh

# 默认变量设置（如果 Flux 面板没设置，则使用这些默认值）
export UUID=${UUID:-"535a6590-fabf-4c30-a555-2e135d42e789"}
export WS_PATH=${WS_PATH:-"//?ed=2048"}

echo "------------------------------------------------"
echo "Step 1: 正在对当前 Flux 节点进行网络测速..."
echo "------------------------------------------------"

# 下载并直接运行 speedtest-cli 脚本
wget -qO- https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -

echo "------------------------------------------------"
echo "Step 2: 测速完成，正在配置 Xray..."
echo "------------------------------------------------"

# 使用 sed 替换模板中的占位符
# 注意：WS_PATH 包含斜杠和特殊字符，因此 sed 使用 | 作为分隔符
sed -e "s/\${UUID}/$UUID/g" \
    -e "s|\${WS_PATH}|$WS_PATH|g" \
    /etc/xray/config.template.json > /etc/xray/config.json

echo "配置已生成。UUID: $UUID, Path: $WS_PATH"
echo "------------------------------------------------"
echo "Step 3: 启动 Xray 服务..."
echo "------------------------------------------------"

# 启动服务
exec xray -config /etc/xray/config.json
