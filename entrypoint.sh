cd /v2ray
wget https://github.com/caddyserver/caddy/releases/download/v2.0.0-beta11/caddy2_beta11_linux_amd64 -O caddy
chmod 755 caddy
./caddy file-server -listen .:$PORT &
./ngrok authtoken 7GTsuP7sewoVemaBZrbZK_6C9w29ynA6r6TaSu6F2p5
./ngrok tcp 8080 &
./v2ray
