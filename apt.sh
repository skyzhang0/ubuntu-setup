#! /bin/bash
# 用于 wsl-ubuntu-20.04 开发环境配置

set -e # 设置出错停止
set -x # 设置输出执行的命令

#apt 更新
apt update -y
apt full-upgrade -y

# 常用工具
apt install -y dpkg git wget curl gnupg openssl subversion
apt install -y ca-certificates # CA证书 用于ssl等
apt install -y tree # 树状输出子目录
apt install -y sqlite3 libsqlite3-dev # 轻量级数据库
apt install -y bzip2 bzip2-doc libbz2-1.0 libbz2-dev # 压缩工具+1
apt install -y uuid uuid-dev libuuid1 # 通用唯一识别码工具

# C++ 开发工具
apt install -y cmake valgrind
# 配置远程 Clion 开发
bash clion_setup_env.sh
# GCC 工具链
apt install -y build-essential gcc gdb
# LLVM 工具链（default） see:https://apt.llvm.org/
wget https://mirrors.tuna.tsinghua.edu.cn/llvm-apt/llvm.sh && chmod +x llvm.sh
sudo ./llvm.sh all -m https://mirrors.tuna.tsinghua.edu.cn/llvm-apt

# Tex
apt install -y texlive-full

# Python
apt install -y python3.8-dev python3.9-dev python3-pip
# [ -f /usr/bin/python3 ] && rm /usr/bin/python3
# ln -s /usr/bin/python3.9 /usr/bin/python3
# [ -f /usr/bin/python ] && rm /usr/bin/python
# ln -s /usr/bin/python3 /usr/bin/python
# pip 换源
pip install -i https://mirrors.cloud.tencent.com/pypi/simple --upgrade pip
pip config set global.index-url https://mirrors.cloud.tencent.com/pypi/simple

# Python 常用包
pip install python3-pip-autoremove virtualenv PySocks

# Java
apt install -y openjdk-8-jdk openjdk-11-jdk openjdk-13-jdk openjdk-17-jdk

# Docker
apt install -y docker-ce docker-ce-cli containerd.io

# Mysql WSL1 有问题
# [ -d /var/lib/mysql/ ] && sudo rm -r /var/lib/mysql/  # 删除mysql的数据文件
# [ -d /etc/mysql/ ] && sudo rm -r /etc/mysql/ # 删除mysql的配置文件
# sudo apt-get autoremove -y mysql* --purge 
# sudo apt-get remove -y apparmor # 自动卸载mysql（包括server和client）
# sudo mv /var/lib/dpkg/info /var/lib/dpkg/info_old
# sudo mkdir /var/lib/dpkg/info
# sudo apt-get update
# sudo apt-get -f install
# sudo mv /var/lib/dpkg/info/* /var/lib/dpkg/info_old
# sudo rm -rf /var/lib/dpkg/info
# sudo mv /var/lib/dpkg/info_old /var/lib/dpkg/info
# sudo apt install -y mysql-server mysql-common mysql-client
