#! /bin/bash
# 编译安装 MPFR

# 设置 MPFR 版本号，如果要安装其他版本仅需修改此变量
mpfr_version = "4.1.0"

# 设置出错停止
set -e

# 设置代理
source ../set_proxy.sh

if [ -f mpfr-${mpfr_version}.tar.xz ]; then
    rm mpfr-${mpfr_version}.tar.xz
fi
if [ -d mpfr-${mpfr_version} ]; then
    rm -r mpfr-${mpfr_version}
fi

# wget https://mirrors.tuna.tsinghua.edu.cn/gnu/mpfr/mpfr-4.1.0.tar.xz
wget https://mirrors.tuna.tsinghua.edu.cn/gnu/mpfr/mpfr-${mpfr_version}.tar.xz
# tar -xf mpfr-4.1.0.tar.xz
tar -xf mpfr-${mpfr_version}.tar.xz
cd mpfr-${mpfr_version}
./configure
make -j 6
sudo make install 
cd ..

if [ -f mpfr-${mpfr_version}.tar.xz ]; then
    rm mpfr-${mpfr_version}.tar.xz
fi
if [ -d mpfr-${mpfr_version} ]; then
    rm -r mpfr-${mpfr_version}
fi
