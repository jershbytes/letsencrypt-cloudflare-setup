#!/usr/bin/bash

set -e

# Load environment variables
set -a
source le.env
set +a

# Create a temporary credentials file
CREDENTIALS_FILE=$(mktemp)
echo "dns_cloudflare_api_token = $CLOUDFLARE_DNS_API_TOKEN" > $CREDENTIALS_FILE
chmod 600 $CREDENTIALS_FILE

onlycert() {
  certbot certonly --dns-$DNS_PROVIDER --dns-$DNS_PROVIDER-credentials $CREDENTIALS_FILE --agree-tos -n -d $CERT_HOSTS -m $CERT_EMAIL
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
    echo "Moving cockpit cert into place..."
    cockpit
    ;;
  *)
    echo "ERROR: No valid action provided."
    exit 1
    ;;
esac