#! /bin/bash
# 编译安装 GCC 工具链最新版本

set -e # 设置出错停止
set -x # 设置输出执行的命令

# 设置 GCC/GDB 默认版本号
gcc_version="12.1.0"
if [ $# -ge 1 ]; then # 若有参数则把第一个作为版本号
    gcc_version="$1"
fi

gdb_version=${gcc_version%.*} # gdb版本号 为gcc版本号去掉最后的小版本号
gcc_main_version=${gcc_version%%.*} # gcc大版本号
gdb_main_version=${gdb_version%%.*} # gdb大版本号

# 设置代理
source ../set_proxy.sh

# 安装依赖
sudo bash ./gmp.sh
sudo bash ./mpfr.sh
sudo bash ./mpc.sh

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
./configure --disable-multilib --program-suffix=-${gcc_main_version}
make -j 6
sudo make install
cd ..

cd gdb-${gdb_version}
./configure --program-suffix=-${gdb_main_version}
make -j 6
sudo make install
cd ..

# 在版本管理工具中注册
[ -f /usr/local/bin/gcc ] && sudo rm /usr/local/bin/gcc # TODO 还有编译生成的其他文件需要删除
[ -f /usr/local/bin/g++ ] && sudo rm /usr/local/bin/g++
sudo update-alternatives --install /usr/bin/gcc gcc /usr/local/bin/gcc-${gcc_main_version} 10 --slave /usr/bin/g++ g++ /usr/local/bin/g++-${gcc_main_version}
rm /usr/lib/x86_64-linux-gnu/libstdc++.so.6
ln -s /usr/local/lib64/libstdc++.so.6 /usr/lib/x86_64-linux-gnu/libstdc++.so.6

[ -f gcc-${gcc_version}.tar.gz ] && rm gcc-${gcc_version}.tar.gz
[ -f gdb-${gdb_version}.tar.gz ] && rm gdb-${gdb_version}.tar.gz
[ -d gcc-${gcc_version} ] && rm -r gcc-${gcc_version}
[ -d gdb-${gdb_version} ] && rm -r gdb-${gdb_version}
