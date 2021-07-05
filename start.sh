#!/bin/bash
###说明###
###$1 端口 #$2 nodeId #$3 webapi #$4 token###

echo "开始初始化"

apt update -y && apt install curl wget git -y

curl -fsSL https://get.docker.com | bash -s docker 

systemctl enable --now docker

curl -L https://get.daocloud.io/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose -v

echo "poseidon"

git clone https://github.com/ColetteContreras/v2ray-poseidon.git

cd v2ray-poseidon/docker/v2board/tcp/

sed -i -e "s#服务端口#$1#g" docker-compose.yml
rm -rf config.json
cat > config.json <<EOF
{
  "poseidon": {
    "panel": "v2board",
    "nodeId": $2,
    "checkRate": 60,
    "webapi": "$3",
    "token": "$4",
    "speedLimit": 0,
    "user": {
      "maxOnlineIPCount": 0,
      "speedLimit": 0 
    },
    "acceptProxyProtocol": false
  }
}
EOF

docker-compose up -d --force-recreate
