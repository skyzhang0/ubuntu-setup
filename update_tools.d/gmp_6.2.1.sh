#! /bin/bash
# 编译安装 GMP

# 设置 GMP 版本号，如果要安装其他版本仅需修改此变量
gmp_version="6.2.1"

# 设置出错停止
set -e

# 设置代理
source ./set_proxy.sh

# 安装依赖
sudo bash ./update_tools.d/m4_1.4.19.sh

if [ -f gmp-${gmp_version}.tar.xz ]; then
    rm gmp-${gmp_version}.tar.xz
fi
if [ -d gmp-${gmp_version} ]; then
    rm -r gmp-${gmp_version}
fi

# wget https://mirrors.tuna.tsinghua.edu.cn/gnu/gmp/gmp-6.2.1.tar.xz
wget https://mirrors.tuna.tsinghua.edu.cn/gnu/gmp/gmp-${gmp_version}.tar.xz
# tar -xf gmp-6.2.1.tar.xz
tar -xf gmp-${gmp_version}.tar.xz
cd gmp-${gmp_version}
./configure
make -j 6
sudo make install
cd ..

if [ -f gmp-${gmp_version}.tar.xz ]; then
    rm gmp-${gmp_version}.tar.xz
fi
if [ -d gmp-${gmp_version} ]; then
    rm -r gmp-${gmp_version}
fi