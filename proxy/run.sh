#!/bin/sh

set -e

envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf
# `daemon off` - run the service in foreground
nginx -g 'daemon off;'
