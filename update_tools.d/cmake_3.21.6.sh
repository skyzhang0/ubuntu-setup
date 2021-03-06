#! /bin/bash
# 编译安装 cmake 最新版本

# 设置 CMake 版本号，如果要安装其他版本仅需修改此变量
cmake_version="3.21.6"

# 设置出错停止
set -e

# 设置代理
source ../set_proxy.sh

apt install -y build-essential # 基础编译工具
apt install -y libssl-dev      # 依赖

[ -d ./cmake/ ] && rm -r ./cmake/

git clone https://gitee.com/mirrors/CMake.git cmake
cd cmake
# git checkout v3.21.6
git checkout v${cmake_version}
./bootstrap
make -j 8
make install
cd ..

[ -d cmake ] && rm -r cmake
