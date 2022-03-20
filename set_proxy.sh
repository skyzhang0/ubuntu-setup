#! /bin/bash
# 配置 WSL 使用 windows 系统代理（仅适用于 WSL1）

# 将内容复制到 /etc/environment 

# 配置代理 WSL2
export hostip=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')
export https_proxy="http://${hostip}:18889"
export http_proxy="http://${hostip}:18889"
export ALL_PROXY="http://${hostip}:18889"
export FTP_PROXY="http://${hostip}:18889"

# 配置代理 WSL1
export ALL_PROXY=http://127.0.0.1:18889
export HTTP_PROXY=http://127.0.0.1:18889
export HTTPS_PROXY=http://127.0.0.1:18889
export FTP_PROXY=http://127.0.0.1:18889

# 配置 git 代理
git config --global http.proxy "socks5://127.0.0.1:18888"
git config --global https.proxy "socks5://127.0.0.1:18888"
