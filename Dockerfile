FROM teddysun/xray:latest

# 安装 Python3 和工具包，用于启动前的网络测速
RUN apk update && apk add --no-cache python3 wget curl

# 复制配置文件模板和启动脚本
COPY config.template.json /etc/xray/config.template.json
COPY start.sh /start.sh

# 赋予启动脚本执行权限
RUN chmod +x /start.sh

# 暴露 Flux 面板中设置的端口
EXPOSE 1080

# 启动容器时执行脚本
CMD ["/start.sh"]
