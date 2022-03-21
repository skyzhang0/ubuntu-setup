#! /bin/bash
# 编译安装 GCC 工具链最新版本

# 设置 GCC/GDB 版本号，如果要安装其他版本仅需修改此变量
gcc_version = "11.2"

# 设置出错停止
set -e

# 设置代理
source ../set_proxy.sh

# 安装依赖
sudo bash ./gmp_6.2.1.sh
sudo bash ./mpfr_4.4.0.sh
sudo bash ./mpc_1.0.1.sh

if [ ! -f gcc-${gcc_version}.0.tar.gz ]; then
    rm gcc-${gcc_version}.0.tar.gz
fi
if [ ! -f gdb-${gcc_version}.tar.gz ]; then
    rm gdb-${gcc_version}.tar.gz
fi
if [ -d gcc-${gcc_version}.0 ]; then
    rm -r gcc-${gcc_version}.0
fi
if [ -d gdb-${gcc_version} ]; then
    rm -r gdb-${gcc_version}
fi

# 下载并解压源码
wget https://mirrors.tuna.tsinghua.edu.cn/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.gz
wget https://mirrors.tuna.tsinghua.edu.cn/gnu/gdb/gdb-11.2.tar.gz
tar -zxf ./gcc-11.2.0.tar.gz
tar -zxf ./gdb-11.2.tar.gz

cd gcc-11.2.0/


if [ -f gcc-${gcc_version}.0.tar.gz ]; then
    rm gcc-${gcc_version}.0.tar.gz
fi

if [ -f gdb-${gcc_version}.tar.gz ]; then
    rm gdb-${gcc_version}.tar.gz
fi
if [ -d gcc-${gcc_version}.0 ]; then
    rm -r gcc-${gcc_version}.0
fi
if [ -d gdb-${gcc_version} ]; then
    rm -r gdb-${gcc_version}
fi
