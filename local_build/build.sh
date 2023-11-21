#!/bin/bash

# Check if the license code is provided as an argument
LICENSE_CODE=${1:-}

# Make sure Docker engine is installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker and try again."
    exit 1
fi

# Check if Docker daemon is running
DOCKER_INFO=$(docker info 2>&1)
if [[ $DOCKER_INFO == *"Cannot connect to the Docker daemon"* ]]; then
    echo "Docker is not running. Please start Docker and try again."
    exit 1
fi

# Build the base image
docker build -t arm64_arm-mlops-docker-base:latest -f ../docker_base/Dockerfile ../docker_base --platform=linux/arm64

# Run an instance of the image in a container
docker run -d --name arm64_build_container -u root -v ../:/workspace --platform=linux/arm64 arm64_arm-mlops-docker-base:latest sleep infinity

# If the license code is provided, export it and copy to build folder
if [[ -n "$LICENSE_CODE" ]]; then
    docker exec arm64_build_container /home/arm_mlops_docker/ArmCompilerforEmbedded6.20/bin/armlm activate --code $LICENSE_CODE --as-user arm64_arm_mlops_docker --to-file /workspace/arm_mlops_docker_license
    cp ../arm_mlops_docker_license ../docker_licensed/arm_mlops_docker_license
fi

# Build an image based on the base image, adding the license. This needs to be rebuild whenever the license expires
docker build -t arm64_arm-mlops-docker-licensed:latest -f ../docker_licensed/Dockerfile ../docker_licensed --build-arg BASE_IMAGE=arm64_arm-mlops-docker-base  --platform=linux/arm64

# Run an instance of the image
docker run -d --name arm64_arm_mlops_container -u root -v $(readlink -f ../):/workspace --platform=linux/arm64 arm64_arm-mlops-docker-licensed:latest sleep infinity

# Test if the Arm Compiler can be executed and displays your license
docker exec arm64_arm_mlops_container su -l arm_mlops_docker -c "/home/arm_mlops_docker/ArmCompilerforEmbedded6.20/bin/armclang --version"

# Test if a Arm Virtual Hardware FVP can be executed 
docker exec arm64_arm_mlops_container su -l arm_mlops_docker -c "/home/arm_mlops_docker/avh-fvp-11.22.39/avh-linux-x86/bin/FVP_MPS2_Cortex-M33 --version"

