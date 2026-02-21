#!/bin/sh

# 如果没有设置环境变量，则使用默认值（强烈建议在 Flux 面板中修改这些变量）
UUID=${UUID:-"b831381d-6324-4d53-ad4f-8cda48b30811"}
WS_PATH=${WS_PATH:-"/vless"}

# 使用环境变量替换模板中的占位符
sed -e "s/\${UUID}/$UUID/g" \
    -e "s|\${WS_PATH}|$WS_PATH|g" \
    /etc/xray/config.template.json > /etc/xray/config.json

# 打印生成的配置（用于在 Flux 日志中排错，生产环境确认无误后可删除此行）
echo "Current Xray Config:"
cat /etc/xray/config.json

# 启动 Xray
exec xray -config /etc/xray/config.json
