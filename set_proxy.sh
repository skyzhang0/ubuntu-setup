#! /bin/bash
# 配置 WSL 使用 windows 系统代理（仅适用于 WSL1）

# 将内容复制到 sudo vim /etc/environment 

# 配置 WSL2 使用主机代理
# export HOST_IP=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')

# 配置 v2fly (需要 Docker)
# docker pull v2fly/v2fly-core
# docker run -d --name v2ray -v /etc/v2ray:/etc/v2ray -p 18888:18888 v2ray/official  v2ray -config=/etc/v2ray/config.json
# HOST_IP=127.0.0.1

# 配置系统级代理，此处一定要小写，因为wget 区分大小写
# export https_proxy="http://${HOST_IP}:18888"
# export http_proxy="http://${HOST_IP}:18888"
# export all_proxy="http://${HOST_IP}:18888"
# export ftp_proxy="http://${HOST_IP}:18888"

# 配置 git 代理
# git config --global http.proxy "http://${HOST_IP}:18888"
# git config --global https.proxy "http://${HOST_IP}:18888"
