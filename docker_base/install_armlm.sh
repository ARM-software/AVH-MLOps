#!/bin/bash

# Function to install dependencies
install_dependencies() {
    echo "Installing dependencies..."
    apt-get update
    apt-get install -y wget tar
}

# Function to download and install the Arm License Manager
install_arm_license_manager() {
    ARCH=$(uname -m)
    if [ "$ARCH" == "x86_64" ]; then
        URL="https://artifacts.tools.arm.com/armlm/1.4.0/armlm-1.4.0-lin-x86_64.tar.gz"
    elif [ "$ARCH" == "aarch64" ]; then
        URL="https://artifacts.tools.arm.com/armlm/1.4.0/armlm-1.4.0-lin-arm_64.tar.gz"
    else
        echo "Unsupported architecture: $ARCH"
        exit 1
    fi

    echo "Downloading Arm License Manager from $URL..."
    wget -O arm-license-manager.tar.gz "$URL"

    echo "Extracting Arm License Manager..."ls 
    mkdir -p /opt/armlm
    tar -xzf arm-license-manager.tar.gz -C /opt/armlm

    echo "Setting up environment variables..."
    echo "export PATH=\$PATH:/opt/armlm/bin" >> /etc/profile.d/arm_license_manager.sh
    source /etc/profile.d/arm_license_manager.sh

    echo "Arm License Manager installation completed."
}

# Main script execution
install_dependencies
install_arm_license_manager