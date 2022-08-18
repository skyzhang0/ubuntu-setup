#! /bin/bash
# 编译安装 MPC

# 设置 MPC 版本号，如果要安装其他版本仅需修改此变量
mpc_version="1.2.1"

# 设置出错停止
set -e

# 设置代理
source ../set_proxy.sh

if [ -f mpc-${mpc_version}.tar.xz ]; then
    rm mpc-${mpc_version}.tar.xz
fi
if [ -d mpc-${mpc_version} ]; then
    rm -r mpc-${mpc_version}
fi

# wget https://mirrors.cloud.tencent.com/gnu/mpc/mpc-1.2.1.tar.gz
wget https://mirrors.cloud.tencent.com/gnu/mpc/mpc-${mpc_version}.tar.gz
# tar -xf mpc-1.2.1.tar.gz
tar -xf mpc-${mpc_version}.tar.gz
cd mpc-${mpc_version}
./configure
make -j 6
sudo make install 
cd ..

if [ -f mpc-${mpc_version}.tar.xz ]; then
    rm mpc-${mpc_version}.tar.xz
fi
if [ -d mpc-${mpc_version} ]; then
    rm -r mpc-${mpc_version}
fi
