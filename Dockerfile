FROM teddysun/xray:latest

# 复制模板和启动脚本
COPY config.template.json /etc/xray/config.template.json
COPY start.sh /start.sh

# 赋予执行权限
RUN chmod +x /start.sh

# 暴露端口
EXPOSE 1080

# 运行启动脚本
CMD ["/start.sh"]
