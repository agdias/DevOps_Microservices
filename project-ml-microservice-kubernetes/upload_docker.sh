#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath="predict:latest"
# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login 
docker tag predict:latest angelodias/predict:latest
# Step 3:
# Push image to a docker repository
docker tag $dockerpath angelodias/${dockerpath}
docker push angelodias/${dockerpath}
