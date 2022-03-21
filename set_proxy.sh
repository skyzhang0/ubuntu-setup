#! /bin/bash
# 配置 WSL 使用 windows 系统代理（仅适用于 WSL1）

# 将内容复制到 sudo vim /etc/environment 

# 配置代理 WSL2
export HOST_IP=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')
export HTTPS_PROXY="http://${HOST_IP}:18889"
export HTTP_PROXY="http://${HOST_IP}:18889"
export ALL_PROXY="http://${HOST_IP}:18889"
export FTP_PROXY="http://${HOST_IP}:18889"

# 配置 git 代理
git config --global http.proxy "socks5://${HOST_IP}:18888"
git config --global https.proxy "socks5://${HOST_IP}:18888"
