#! /bin/bash
# nvm

set -e # 设置出错停止
set -x # 设置输出执行的命令

# 设置 nvm 版本号，如果要安装其他版本仅需修改此变量
nvm_version="0.39.1"

CURRENT_DIR="$(
    cd "$(dirname "$0")"
    pwd
)"

CURR_USER=""
if [ ! -z $SUDO_USER ]; then
    CURR_USER=${SUDO_USER}
else
    CURR_USER=${USER}
fi

NVM_DIR="/home/${CURR_USER}/.nvm"
[ -d ${NVM_DIR} ] && sudo rm -r ${NVM_DIR}
git clone https://gitee.com/mirrors/nvm.git ${NVM_DIR}
cd ${NVM_DIR}
git checkout v${nvm_version}

# 配置 nvm 自启动
sudo echo "export NVM_DIR=\"/home/${CURR_USER}/.nvm\"" | sudo tee -a /etc/profile.d/nvm.sh
echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" | sudo tee -a /etc/profile.d/nvm.sh
echo "[ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\"" | sudo tee -a /etc/profile.d/nvm.sh >sudo tee -a /etc/profile.d/nvm.sh
echo "export NVM_NODEJS_ORG_MIRROR=https://npmmirror.com/mirrors/node/" | sudo tee -a /etc/profile.d/nvm.sh

# 启用 nvm 环境
source /etc/profile.d/nvm.sh

# 按照 node 并启用最新版
nvm install 11
nvm install 12
nvm install 15
nvm install 16
nvm install 17
nvm install 18
nvm install node
nvm use node

# npm
npm install -g cnpm --registry=https://registry.npmmirror.com
npm install -g nrm
nrm use taobao
npm install -g yarn
npm install -g yrm
yrm use taobao
