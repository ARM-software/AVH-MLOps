#!/bin/bash

echo "Checking for sudo permissions..."
if ! sudo -v; then
    echo "This script requires sudo permissions. Please run as root or with sudo."
    exit 1
fi

echo "Starting to set environment variables to /etc/environment ..."

set -a

# Check if a positional argument (path) is provided and if it's valid
if [ -n "$1" ] && [ -f "$1/env.json" ]; then
    ENV_PATH="$1/env.json"
    echo "Using environment variables from provided path: $ENV_PATH"
elif [ -f "./env.json" ]; then
    ENV_PATH="./env.json"
    echo "Using environment variables from current directory: $ENV_PATH"
else
    echo "env.json not found in the provided path or the current directory."
    exit 1
fi

echo "Loading environment variables from $ENV_PATH"

while IFS= read -r line; do
    key=$(echo "$line" | cut -d'=' -f1 | cut -d' ' -f2)
    value=$(echo "$line" | cut -d'=' -f2- | sed 's/^"//;s/"$//')
    
    if [ "$key" = "PATH" ]; then
        echo "Extending PATH with: $value"
        echo \"PATH=\\\"\$PATH:$value\\\"\" >> /etc/profile
        echo "PATH variable updated."
    else
        echo "Setting $key to: $value"
        echo \"$key=\\\"$value\\\"\" >> /etc/profile
        echo "$key variable updated."
    fi
done < "$ENV_PATH"

echo "Environment variables have been successfully written to /etc/profile"