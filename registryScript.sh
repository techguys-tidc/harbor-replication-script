#!/bin/bash

HARBOR_API_URL="https://harbor.poc.workisboring.com/api/v2.0/registries"

create_registry() {
  curl -X POST \
    -u "admin:w,j.shg-hk132" \
    -H "Content-Type: application/json" \
    -d '{
      "url": "'"$1"'",
      "name": "'"$2"'",
      "type": "'"$3"'",
      "insecure": '"$4"',
      "description": "'"$5"'"
    }' \
    "$HARBOR_API_URL"
}

create_registry 'https://ghcr.io' 'ghcr.io' 'github-ghcr' false 'healthy'
create_registry 'https://registry.k8s.io' 'registry.k8s.io' 'docker-registry' false 'healthy'
create_registry 'https://gcr.io' 'gcr' 'docker-registry' true 'healthy'
create_registry 'https://k8s.gcr.io' 'k8s.gcr.io' 'docker-registry' false 'healthy'
create_registry 'https://hub.docker.com' 'hub.docker.com' 'docker-hub' false 'healthy'
create_registry 'https://quay.io' 'quay.io' 'quay' false 'healthy'
create_registry 'https://docker.io' 'docker_io' 'docker-registry' false 'healthy'
create_registry 'https://asia.gcr.io' 'asia.gcr.io' 'docker-registry' false 'healthy'
