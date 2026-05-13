#!/bin/bash
REGISTRY_USER="your_dockerhub_username"
IMAGE_NAME="my-web-app"
TAG=$(date +%Y%m%d%H%M) 
FULL_IMAGE_PATH="$REGISTRY_USER/$IMAGE_NAME:$TAG"

echo "Starting build for $FULL_IMAGE_PATH..."

docker build -t $FULL_IMAGE_PATH .

if [ $? -ne 0 ]; then
    echo "ERROR: Docker build failed. Exiting..."
    exit 1
fi

echo "Pushing image to Docker Hub..."
docker push $FULL_IMAGE_PATH

if [ $? -eq 0 ]; then
    echo "SUCCESS: Image pushed to $FULL_IMAGE_PATH"
    
    echo "Cleaning up local image..."
    docker rmi $FULL_IMAGE_PATH
else
    echo "ERROR: Failed to push image. Check your 'docker login' status."
    exit 1
fi

