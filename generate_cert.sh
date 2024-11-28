#!/bin/bash

read -rp "Please Enter FQDN: " FQDN
read -rp "Please Enter Email: " EMAIL

certbot certonly \
  --dns-cloudflare \
  --dns-cloudflare-credentials ~/.secrets/certbot/cloudflare.ini \
  -m $EMAIL \
  -- agree-tos \
  -n \
  -d $FQDN
