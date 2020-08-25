#!/usr/bin/env bash
set -aeuo pipefail

sed -i "/ENVIRONMENT=/c ENVIRONMENT=production" .env
sed -i '/DOCKER_NETWORK_IPAM_SUBNET/s/^#\ //g' .env
sed -i '/DOCKER_NETWORK_IPAM_GATEWAY/s/^#\ //g' .env
sed -i "/REACT_HTTP_PORT=/c REACT_HTTP_PORT=9002" .env
sed -i "/LARAVEL_HTTP_PORT=/c LARAVEL_HTTP_PORT=9003" .env
sed -i "/DRUPAL_HTTP_PORT=/c LARAVEL_HTTP_PORT=9004" .env
sed -i "/APP_ENV=/c APP_ENV=production" .env
sed -i "/BASE_URL=/c BASE_URL=https://base.it-consultis.net" .env
sed -i "/API_URL=/c API_URL=https://base-api.it-consultis.net" .env
sed -i "/ADMIN_BACKEND_DOMAIN=/c ADMIN_BACKEND_DOMAIN=base-admin.it-consultis.net" .env
sed -i "/ADMIN_SECURE=/c ADMIN_SECURE=true" .env
