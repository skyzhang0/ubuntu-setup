#! /bin/bash
# nvm

# 设置出错停止
set -e

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

source /etc/profile.d/nvm.sh

source ${CURRENT_DIR}/npm.sh
