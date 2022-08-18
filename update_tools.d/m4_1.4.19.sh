#! /bin/bash
# 编译安装 M4

# 设置 M4 版本号，如果要安装其他版本仅需修改此变量
m4_version="1.4.19"

# 设置出错停止
set -e

# 设置代理
source ../set_proxy.sh

[ -f m4-${m4_version}.tar.xz ] && rm m4-${m4_version}.tar.xz
[ -d m4-${m4_version} ] && rm -r m4-${m4_version}

# wget https://mirrors.cloud.tencent.com/gnu/m4/m4-1.4.19.tar.xz
wget https://mirrors.cloud.tencent.com/gnu/m4/m4-${m4_version}.tar.xz
# tar -xf m4-1.4.19.tar.xz
tar -xf m4-${m4_version}.tar.xz
cd m4-${m4_version}
./configure
make -j 6
sudo make install 
cd ..

[ -f m4-${m4_version}.tar.xz ] && rm m4-${m4_version}.tar.xz
[ -d m4-${m4_version} ] && rm -r m4-${m4_version}
