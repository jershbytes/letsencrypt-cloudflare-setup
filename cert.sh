#!/bin/bash

# Set error mode
set -e

# Load environment variables
set -a
source ./conf/le.env
set +a

onlycert() {certbot certonly \
  --dns-$DNS_PROVIDER \
  --dns-cloudflare-credentials "$CLOUDFLARE_DNS_API_TOKEN" \
  -m $CERT_EMAIL \
  -- agree-tos \
  -n \
  -d $CERT_HOSTS
}

cockpit() {
cp /etc/letsencrypt/live/$CERT_HOSTS/fullchain.pem /etc/cockpit/ws-certs.d/$CERT_HOSTS.crt
cp /etc/letsencrypt/live/$CERT_HOSTS/privkey.pem /etc/cockpit/ws-certs.d/$CERT_HOSTS.key
chown cockpit-ws:cockpit-ws /etc/cockpit/ws-certs.d/$CERT_HOSTS.crt /etc/cockpit/ws-certs.d/$CERT_HOSTS.key

echo "Restarting Cockpit"
systemctl restart cockpit

echo "SSL certificates renewed"
}

case $1 in
  onlycert)
  echo "Creating cert..." 
    onlycert
    ;;
  cockpit)
    echo "Moing cockpit cert into place..."
    cockpit
    ;;
  *)
	echo "ERROR: No valid action provided."
	usage
	exit 1
	;;
esac

