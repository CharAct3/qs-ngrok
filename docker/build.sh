#!/bin/bash

cd /
git clone https://github.com/inconshreveable/ngrok.git
mkdir /ngrok/tls && cd /ngrok/tls

# 1. Generate openssl cert
openssl genrsa -out rootCA.key 2048
openssl req -x509 -new -nodes -key rootCA.key -subj "/CN=$NGROK_DOMAIN" -days 5000 -out rootCA.pem
openssl genrsa -out device.key 2048
openssl req -new -key device.key -subj "/CN=$NGROK_DOMAIN" -out device.csr
openssl x509 -req -in device.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out device.crt -days 5000
cp rootCA.pem /ngrok/assets/client/tls/ngrokroot.crt

# 2. Build Ngrok
cd /ngrok
make release-server release-client

cat > /release/run_server.sh <<EOF
#!/bin/sh
DOMAIN=${DOMAIN}
TUNNEL_PORT=${TUNNEL_PORT}
HTTP_PORT=${HTTP_PORT}
HTTPS_PORT=${HTTPS_PORT}
/ngrok/bin/ngrokd -tlsKey=/ngrok/tls/device.key -tlsCrt=/ngrok/tls/device.crt -domain="\$DOMAIN" -httpAddr=":\$HTTP_PORT" -httpsAddr=":\$HTTPS_PORT" -tunnelAddr=":\$TUNNEL_PORT"
EOF

chmod 755 /release/run_server.sh
