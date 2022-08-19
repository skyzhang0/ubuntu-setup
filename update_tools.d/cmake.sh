#! /bin/bash
# 编译安装 cmake 最新版本

set -e # 设置出错停止
set -x # 设置输出执行的命令

# 设置 CMake 默认版本号
cmake_version="3.21.6"=
if [ $# -ge 1 ]; then # 若有参数则把第一个作为版本号
    cmake_version="$1"
fi

# 设置代理
source ../set_proxy.sh

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
