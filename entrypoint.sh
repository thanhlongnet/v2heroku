cd /v2ray
./caddy file-server -listen :$PORT &
./ngrok authtoken 7GTsuP7sewoVemaBZrbZK_6C9w29ynA6r6TaSu6F2p5
./ngrok tcp 8080 &
./v2ray
