#! /bin/bash
# 编译安装 GCC 工具链最新版本

# 设置 GCC/GDB 默认版本号
gcc_version="12.1.0"
gdb_version=${gcc_version%.*}
if [ $# -ge 1 ]; then # 若有参数则把第一个作为版本号
    gcc_version="$1"
    gdb_version=${gcc_version%.*}
fi

# 设置出错停止
set -e

# 设置代理
source ../set_proxy.sh

# 安装依赖
sudo bash ./gmp_6.2.1.sh
sudo bash ./mpfr_4.1.0.sh
sudo bash ./mpc_1.2.1.sh

[ -f gcc-${gcc_version}.tar.gz ] && rm gcc-${gcc_version}.tar.gz
[ -f gdb-${gdb_version}.tar.gz ] && rm gdb-${gdb_version}.tar.gz
[ -d gcc-${gcc_version} ] && rm -r gcc-${gcc_version}
[ -d gdb-${gdb_version} ] && rm -r gdb-${gdb_version}

# 下载并解压源码
wget https://mirrors.cloud.tencent.com/gnu/gcc/gcc-${gcc_version}/gcc-${gcc_version}.tar.gz
wget https://mirrors.cloud.tencent.com/gnu/gdb/gdb-${gdb_version}.tar.gz
tar -zxf ./gcc-${gcc_version}.tar.gz
tar -zxf ./gdb-${gdb_version}.tar.gz

cd gcc-${gcc_version}
./configure --disable-multilib
make -j 6
sudo make install
cd ..

cd gdb-${gdb_version}
./configure
make -j 6
sudo make install
cd ..

rm /usr/lib/x86_64-linux-gnu/libstdc++.so.6
ln -s /usr/local/lib64/libstdc++.so.6 /usr/lib/x86_64-linux-gnu/libstdc++.so.6

[ -f gcc-${gcc_version}.tar.gz ] && rm gcc-${gcc_version}.tar.gz
[ -f gdb-${gdb_version}.tar.gz ] && rm gdb-${gdb_version}.tar.gz
[ -d gcc-${gcc_version} ] && rm -r gcc-${gcc_version}
[ -d gdb-${gdb_version} ] && rm -r gdb-${gdb_version}
