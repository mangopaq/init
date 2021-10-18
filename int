#!/bin/bash
###说明###
###$1 ApiHost #$2 ApiKey #$3 NodeID###

echo "XrayR"

git clone https://github.com/XrayR-project/XrayR-release.git

cd XrayR-release

sed -i -e "s#ApiHost#$1#g" config/config.yml
sed -i -e "s#ApiKey#$1#g" config/config.yml
sed -i -e "s#NodeID#$1#g" config/config.yml

docker-compose up -d --force-recreate
