#!/bin/sh
SOFTETHER_VPNCMD_PATH="Path To vpncmd"
PORKBUN_API_KEY="Api Key"
PORKBUN_API_SECRET="Secret"
HOSTNAME="HostName"
EMAIL="Email"
SOFTETHER_PASSWORD="Password"
SOFTETHER_HOST="Host:Port"
certbot certonly \
  --non-interactive \
  --agree-tos \
  --email $EMAIL \
  --preferred-challenges dns \
  --authenticator dns-porkbun \
  --dns-porkbun-key $PORKBUN_API_KEY \
  --dns-porkbun-secret $PORKBUN_API_SECRET \
  --dns-porkbun-propagation-seconds 60 \
  --key-type rsa \
  --rsa-key-size 4096 \
  --cert-name $HOSTNAME \
  -d "*."$HOSTNAME
$SOFTETHER_VPNCMD_PATH \
    $SOFTETHER_HOST \
    /server \
    /password:$SOFTETHER_PASSWORD \
    /CMD ServerCertSet \
    /LOADCERT:/etc/letsencrypt/live/$HOSTNAME/fullchain.pem \
    /LOADKEY:/etc/letsencrypt/live/$HOSTNAME/privkey.pem