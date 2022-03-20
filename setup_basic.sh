#! /bin/bash
#用于 ubuntu 系统基础配置

# 获取 root 权限
sudo passwd root

# 修改源
sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
sudo cp ./sources.list /etc/apt/sources.list

# 添加 apt-key
sudo wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421

# 更新 apt
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
