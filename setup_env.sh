#! /bin/bash
#用于 wsl-ubuntu-20.04 开发环境配置

# 设置出错停止
set -e

#apt 更新
apt update -y
apt upgrade -y
apt full-upgrade -y
apt autoremove -y

# 常用工具
apt install -y dpkg git wget curl gnupg ca-certificates subversion openssl tree

# C++ 开发工具
apt install -y cmake valgrind
# 远程 Clion 开发
bash clion_setup_env.sh
# GCC 工具链
apt install -y build-essential gcc gdb 
# LLVM 工具链（development branch） see:https://apt.llvm.org/
apt install -y libllvm-15-ocaml-dev libllvm15 llvm-15 llvm-15-dev llvm-15-doc llvm-15-examples llvm-15-runtime
apt install -y clang-15 clang-tools-15 clang-15-doc libclang-common-15-dev libclang-15-dev libclang1-15 clang-format-15 python3-clang-15 clangd-15 clang-tidy-15
apt install -y libfuzzer-15-dev
apt install -y lldb-15
ln -s /usr/bin/lldb-15 /usr/bin/lldb 
apt install -y lld-15
apt install -y libc++-15-dev libc++abi-15-dev
apt install -y libomp-15-dev
apt install -y libclc-15-dev
apt install -y libunwind-15-dev
apt install -y libmlir-15-dev mlir-15-tools

# Tex
apt install -y texlive-full

# Python  
apt install -y python3-dev python3-pip
ln -s /usr/bin/python3.8 /usr/bin/python
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# Python 常用包
pip install python3-pip-autoremove virtualenv PySocks

# Java
apt install -y openjdk-8-jdk openjdk-11-jdk openjdk-13-jdk openjdk-17-jdk 

# nvm, nodejs, npm
git clone https://gitee.com/mirrors/nvm.git /usr/share/nvm
cd /usr/share/nvm
git checkout v0.39.1
source ./nvm.sh
nvm install 11
nvm install 12
nvm install 15
nvm install 16
nvm install 17
nvm install node
nvm use node

# Docker
apt remove -y docker docker-engine docker.io containerd runc
apt install -y docker-ce docker-ce-cli containerd.io
