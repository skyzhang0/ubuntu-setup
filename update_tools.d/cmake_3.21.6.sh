#! /bin/bash
# 编译安装 cmake 最新版本

# 设置 CMake 版本号，如果要安装其他版本仅需修改此变量
cmake_version = "3.21.6"

# 设置出错停止
set -e

# 设置代理
source ../set_proxy.sh

apt install -y build-essential # 基础编译工具
apt install -y libssl-dev      # 依赖

if [ -f cmake-${cmake_version}.tar.gz ]; then
    rm cmake-${cmake_version}.tar.gz
fi
if [ -d cmake-${cmake_version} ]; then
    rm -r cmake-${cmake_version}
fi

wget https://github.com/Kitware/CMake/releases/download/v${cmake_version}/cmake-${cmake_version}.tar.gz
tar -zxf cmake-${cmake_version}.tar.gz
cd cmake-${cmake_version}
./bootstrap
make -j 8
make install
cd ..

if [ -f cmake-${cmake_version}.tar.gz ]; then
    rm cmake-${cmake_version}.tar.gz
fi
if [ -d cmake-${cmake_version} ]; then
    rm -r cmake-${cmake_version}
fi
