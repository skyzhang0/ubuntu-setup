#! /bin/bash
# 编译安装 LLVM+Clang 所有工具的最新版本

# todo
git clone https://github.com/llvm/llvm-project.git
cd llvm-project
mkdir build
cd build
cmake ../llvm
make -j 6
make check
make install
cd ..
cd ..
rm -r llvm-project
