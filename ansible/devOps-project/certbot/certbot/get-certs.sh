#!/usr/bin/env bash

set -x

certbot certonly \
  --dns-digitalocean \
  --dns-digitalocean-credentials /root/certbot/credentials.ini \
  --dns-digitalocean-propagation-seconds 30 \
  --agree-tos \
  -m $yourEmail \
  -d $yourDomain
