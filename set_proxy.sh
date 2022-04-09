#! /bin/bash
# 配置 WSL 使用 windows 系统代理（仅适用于 WSL1）

# 将内容复制到 sudo vim /etc/environment 

# 配置代理 WSL2，此处一定要小写，wget 区分大小写
# export HOST_IP=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')
# export https_proxy="http://${HOST_IP}:18889"
# export http_proxy="http://${HOST_IP}:18889"
# export all_proxy="http://${HOST_IP}:18889"
# export ftp_proxy="http://${HOST_IP}:18889"

# 配置 git 代理
# git config --global http.proxy "http://${HOST_IP}:18889"
# git config --global https.proxy "http://${HOST_IP}:18889"
