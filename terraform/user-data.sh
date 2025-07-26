


#!/usr/bin/env bash
IMAGE_TAG="$1"
REPO="${DOCKERHUB_USERNAME:=balagouninaveen}/strapi"

# Install Docker if missing
if ! command -v docker &> /dev/null; then
  sudo apt-get update -y
  sudo apt-get install -y docker.io
  sudo usermod -aG docker ubuntu
fi

# Pull and run container
docker pull "${REPO}:${IMAGE_TAG}"
docker stop strapi || true
docker rm strapi || true
docker run -d --name strapi -p 1337:1337 "${REPO}:${IMAGE_TAG}"
