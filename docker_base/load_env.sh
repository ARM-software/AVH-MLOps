#!/bin/bash

echo "Starting to load environment variables..."

set -a

# Check if a positional argument (path) is provided and if it's valid
if [ -n "$1" ] && [ -f "$1/env.json" ]; then
    ENV_PATH="$1/env.json"
elif [ -f "./env.json" ]; then
    ENV_PATH="./env.json"
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
        eval "export PATH=\"\$PATH:$value\""
    else
        echo "Setting $key to: $value"
        eval "$line"
    fi
done < <(jq -r '.variables | to_entries[] | "export " + .key + "=\"" + (.value | tostring) + "\""' "$ENV_PATH")

set +a

echo "Finished loading environment variables."