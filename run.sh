#!/bin/bash

# Set environment variables
CONTAINER_NAME="polarization_analyzer_container"
IMAGE_NAME="ghcr.io/measurement-plane/ploarization-analyzer:latest"
BROKER_URL="nats://172.17.0.1:4222"
ENDPOINT='polarization_analyzer'


# Stop and remove any running container with the same name
echo "Stopping and removing existing container (if any)..."
docker stop "$CONTAINER_NAME" >/dev/null 2>&1 || true
docker rm "$CONTAINER_NAME" >/dev/null 2>&1 || true

# Pull the latest pre-built image
echo "Pulling the latest image..."
if ! docker pull "$IMAGE_NAME"; then
    echo "Error: Failed to pull the image. Exiting."
    exit 1
fi

# Run the container
echo "Starting the container..."
docker run --name "$CONTAINER_NAME" \
    -e BROKER_URL="$BROKER_URL" -e ENDPOINT=$ENDPOINT\
    "$IMAGE_NAME" || {
    echo "Error: Failed to start the container."
    exit 1
}
