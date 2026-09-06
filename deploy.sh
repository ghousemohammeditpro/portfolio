#!/bin/bash

set -e

echo "Starting deployment..."

cd /opt/portfolio

echo "Pulling latest code..."
git pull origin main

echo "Building Docker image..."
docker compose build

echo "Restarting portfolio..."
docker compose up -d

echo "Removing unused Docker images..."
docker image prune -f

echo "Deployment completed successfully!"

docker ps
