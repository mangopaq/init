#!/bin/bash
###说明###
###$1 端口 #$2 nodeId #$3 webapi #$4 token###

echo "开始初始化"

yum install -y git curl wget 2> /dev/null || apt update -y && apt install -y git curl wget

curl -fsSL https://get.docker.com | bash -s docker 

systemctl enable --now docker

curl -L https://get.daocloud.io/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose -v

echo "XrayR"

git clone https://github.com/XrayR-project/XrayR-release.git

cd XrayR-release

sed -i -e "s#SSpanel#$1#g" config/config.yml
sed -i -e "s#http://127.0.0.1:667#$2#g" config/config.yml
sed -i -e "s#123#$3#g" config/config.yml
sed -i -e "s#41#$4#g" config/config.yml

docker-compose up -d --force-recreate

echo "BBR安装"
cd /tmp
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh
chmod +x bbr.sh

./bbr.sh
