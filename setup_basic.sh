#! /bin/bash
#用于 ubuntu 系统基础配置

# 设置出错停止
set -e

# 获取 root 权限
echo "Now setting root's password:"
sudo passwd root

# 修改源
sudo apt install -y ca-certificates
sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
sudo cp ./sources.list /etc/apt/sources.list
if [ ! -d /etc/apt/sources.list.d]; then
    sudo mkdir /etc/apt/sources.list.d
fi
sudo cp ./sources.list.d/* /etc/apt/sources.list.d

# 修改 Shell 启动文件
[ ! -d /etc/profile.d ] && sudo mkdir /etc/profile.d
sudo cp ./profile.d/* /etc/profile.d

# 添加 llvm 的 apt-key
sudo wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421

# 添加 Docker 的 GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# 添加 Oracle Java PPA
# sudo add-apt-repository ppa:webupd8team/java
