#! /bin/bash
# 编译安装 M4

set -e # 设置出错停止
set -x # 设置输出执行的命令

# 设置 M4 默认版本号
m4_version="1.4.19"
if [ $# -ge 1 ]; then # 若有参数则把第一个作为版本号
    m4_version="$1"
fi

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
