cd /v2raybin
echo $PORT
sed -i "s/PORT/$PORT/g" config.json
./v2ray
