#! /bin/bash
# 编译安装 GCC 工具链最新版本

# 设置 GCC/GDB 版本号，如果要安装其他版本仅需修改此变量
gcc_version = "11.2"

# 设置出错停止
set -e

# 设置代理
source ../set_proxy.sh

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

wget https://mirrors.tuna.tsinghua.edu.cn/gnu/gcc/gcc-${gcc_version}.0/gcc-${gcc_version}.0.tar.gz && wget https://mirrors.tuna.tsinghua.edu.cn/gnu/gdb/gdb-${gcc_version}.tar.gz



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