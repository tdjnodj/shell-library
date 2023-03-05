#!/bin/bash

# Comes from https://github.com/taffychan/naive

install_go() {
    # CPU
    bit=`uname -m`
    if [[ $bit = x86_64 ]]; then
        cpu=amd64
    elif [[ $bit = amd64 ]]; then
        cpu=amd64
    elif [[ $bit = aarch64 ]]; then
        cpu=arm64
    elif [[ $bit = armv8 ]]; then
        cpu=arm64
    elif [[ $bit = armv7 ]]; then
        cpu=arm64
    elif [[ $bit = s390x ]]; then
        cpu=s390x
    else 
        cpu=$bit
        red "可能不支持该型号( $cpu )的CPU!"
    fi
    go_version=$(curl https://go.dev/VERSION?m=text)
    red "当前最新版本golang: $go_version"
    curl -O -k -L https://go.dev/dl/${go_version}.linux-${cpu}.tar.gz
    yellow "正在解压......"
    tar -xf go*.linux-${cpu}.tar.gz -C /usr/local/
    sleep 3
    rm go*.tar.gz
    echo 'export PATH=\$PATH:/usr/local/go/bin' >> /root/.bash_profile
    source /root/.bash_profile
    yellow "检查当前golang版本: "
    go version
    yellow "为确保正常安装，请手动输入: "
    echo "echo 'export PATH=\$PATH:/usr/local/go/bin' >> /root/.bash_profile"
    red "source /root/.bash_profile"
    echo ""
    echo "如果错误，常见错误原因: 未删除旧的go"
}