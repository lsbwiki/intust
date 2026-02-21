FROM teddysun/xray:latest

# 安装测速工具
RUN apk update && apk add --no-cache python3 wget curl

# 复制配置文件和脚本 (改名为 install.sh)
COPY config.json /etc/xray/config.json
COPY install.sh /install.sh

RUN chmod +x /install.sh

# 暴露端口
EXPOSE 1080

# 容器启动命令
CMD ["/bin/sh", "/install.sh"]
