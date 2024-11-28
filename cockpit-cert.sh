#!/usr/bin/env bash

read -rp "Please Enter FQDN: " FQDN

cp /etc/letsencrypt/live/$FQDN/fullchain.pem /etc/cockpit/ws-certs.d/$FQDN.crt
cp /etc/letsencrypt/live/$FQDN/privkey.pem /etc/cockpit/ws-certs.d/$FQDN.key
chown cockpit-ws:cockpit-ws /etc/cockpit/ws-certs.d/$FQDN.crt /etc/cockpit/ws-certs.d/$FQDN.key

echo "Restarting Cockpit"
systemctl restart cockpit

echo "SSL certificates renewed"