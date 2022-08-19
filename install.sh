#! /bin/bash
# 通过编译安装等方法，安装某些工具

set -e # 设置出错停止
set -x # 设置输出执行的命令

cd ./install_tools.d
bash ./nvm.sh
cd ..