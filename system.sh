#! /bin/bash
#用于 ubuntu 系统基础配置

# 设置出错停止
set -e

# 获取 root 权限
echo "Now setting root's password:"
sudo passwd root

# 安装必要工具
sudo apt install -y ca-certificates curl

# 修改源
sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
sudo cp ./sources.list /etc/apt/sources.list
[ ! -d /etc/apt/sources.list.d ] && sudo mkdir /etc/apt/sources.list.d
sudo cp ./sources.list.d/* /etc/apt/sources.list.d
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list

# 修改 Shell 启动文件
[ ! -d /etc/profile.d ] && sudo mkdir /etc/profile.d
sudo cp ./profile.d/* /etc/profile.d

# 添加 llvm 的 apt-key
sudo wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421

# 添加 Docker 的 GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# 加速 Docker
[ ! -d /etc/docker ] && sudo mkdir /etc/docker
sudo cp ./docker/* /etc/docker

# 添加 v2ray 配置文件
[ ! -d /etc/v2ray ] && sudo mkdir /etc/v2ray
sudo cp ./v2ray/* /etc/v2ray

# 添加 Oracle Java PPA
# sudo add-apt-repository ppa:webupd8team/java
