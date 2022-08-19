#! /bin/bash
# 编译安装 MPC

set -e # 设置出错停止
set -x # 设置输出执行的命令

# 设置 MPC 默认版本号
mpc_version="1.2.1"
if [ $# -ge 1 ]; then # 若有参数则把第一个作为版本号
    mpc_version="$1"
fi

# 设置代理
source ../set_proxy.sh

[ -f mpc-${mpc_version}.tar.xz ] && rm mpc-${mpc_version}.tar.xz
[ -d mpc-${mpc_version} ] && rm -r mpc-${mpc_version}

# wget https://mirrors.cloud.tencent.com/gnu/mpc/mpc-1.2.1.tar.gz
wget https://mirrors.cloud.tencent.com/gnu/mpc/mpc-${mpc_version}.tar.gz
# tar -xf mpc-1.2.1.tar.gz
tar -xf mpc-${mpc_version}.tar.gz
cd mpc-${mpc_version}
./configure
make -j 6
sudo make install 
cd ..

[ -f mpc-${mpc_version}.tar.xz ] && rm mpc-${mpc_version}.tar.xz
[ -d mpc-${mpc_version} ] && rm -r mpc-${mpc_version}
