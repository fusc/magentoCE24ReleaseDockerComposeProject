#!/usr/bin/env bash
set -aeuo pipefail

sed -i "/ENVIRONMENT=/c ENVIRONMENT=staging" .env
sed -i '/DOCKER_NETWORK_IPAM_SUBNET/s/^#\ //g' .env
sed -i '/DOCKER_NETWORK_IPAM_GATEWAY/s/^#\ //g' .env
sed -i "/DOCKER_HOST_HTTP_PORT=/c DOCKER_HOST_HTTP_PORT=9995" .env
sed -i "/APP_ENV=/c APP_ENV=staging" .env
sed -i "/BASE_URL=/c BASE_URL=https://pernodricard.it-consultis.net" .env 
sed -i "/REACT_HTTP_PORT=/c REACT_HTTP_PORT=9980" .env
