#! /bin/bash
# 通过编译安装等方法，安装某些工具

# 设置出错停止
set -e

cd ./install_tools.d
bash ./nvm.sh
cd ..