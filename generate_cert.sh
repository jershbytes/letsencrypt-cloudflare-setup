#!/bin/bash

read -rp "Please Enter FQDN: " FQDN

certbot certonly \
  --dns-cloudflare \
  --dns-cloudflare-credentials ~/.secrets/certbot/cloudflare.ini \
  -m $EMAIL \
  -- agree-tos \
  -n \
  -d $FQDN
