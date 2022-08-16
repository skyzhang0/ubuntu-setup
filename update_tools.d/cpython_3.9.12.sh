#! /bin/bash
# 编译安装 python 最新版本

# 设置 CMake 版本号，如果要安装其他版本仅需修改此变量
python_version="3.9.12"

# 设置出错停止
set -e

# 设置代理
source ../set_proxy.sh

[ -d ./cpython/ ] && rm -r ./cpython/

git clone https://gitee.com/mirrors/cpython.git cpython

cd cpython
# git checkout v3.9.12
git checkout v${python_version}
./configure --enable-optimizations
make -j 8
sudo make install
cd ..

[ -d cpython ] && rm -r cpython
