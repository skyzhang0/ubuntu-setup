#! /bin/bash
# 配置 WSL 使用 windows 系统代理（仅适用于 WSL1）

# 将内容复制到 /etc/environment 

# 配置代理
export ALL_PROXY=socks5://127.0.0.1:18888
export HTTP_PROXY=http://127.0.0.1:18889
export HTTPS_PROXY=http://127.0.0.1:18889
export FTP_PROXY=socks5://127.0.0.1:18888

# 配置 git 代理
git config --global http.proxy "socks5://127.0.0.1:18888"
git config --global https.proxy "socks5://127.0.0.1:18888"
