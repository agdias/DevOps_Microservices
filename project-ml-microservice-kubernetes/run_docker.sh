#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 0:
# Check if container is running, delete it and clear its current image

ISRUN=`docker ps -a | grep -i predict | wc -l`

if [ $ISRUN  -gt 0 ]; then
	echo "Container is running."
	CONTID=`docker ps -a | awk '{print $1}'`
	echo "stopping the running container"
	docker stop $CONTID
	echo "removing the container..."
        docker rm $CONTID
	IMID=`docker images | grep -i predict | awk '{print $3}'`
        docker rmi $IMID
fi
# Step 1:
# Build image and add a descriptive tag
echo "Building image..."
docker build -t predict .
# Step 2: 
# List docker images
echo "Available images"
docker image ls

# Step 3: 
# Run flask app

docker run -d   --name predict -p 8000:80   predict:latest
