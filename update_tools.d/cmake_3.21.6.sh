#! /bin/bash
# 编译安装 cmake 最新版本

# 设置出错停止
set -e

apt install -y build-essential # 基础编译工具
apt install -y libssl-dev # 依赖

if [ -f cmake-3.21.6.tar.gz ]; then
    rm cmake-3.21.6.tar.gz
else
    wget https://github.com/Kitware/CMake/releases/download/v3.21.6/cmake-3.21.6.tar.gz
fi
if [ -d cmake-3.21.6 ]; then
    rm -r cmake-3.21.6
fi

tar -zxf cmake-3.21.6.tar.gz
cd cmake-3.21.6
./bootstrap
make -j 8
make install
cd ..

if [ -f cmake-3.21.6.tar.gz ]; then
    rm cmake-3.21.6.tar.gz
fi
if [ -d cmake-3.21.6 ]; then
    rm -r cmake-3.21.6
fi
