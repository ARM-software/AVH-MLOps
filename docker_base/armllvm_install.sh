wget https://github.com/ARM-software/LLVM-embedded-toolchain-for-Arm/releases/download/release-16.0.0/LLVMEmbeddedToolchainForArm-16.0.0-Linux-x86_64.tar.gz -nv
tar -xf LLVMEmbeddedToolchainForArm-16.0.0-Linux-x86_64.tar.gz -C /home/arm_mlops_docker
apt install -y libtinfo5
#echo 'export "/home/arm_mlops_docker/LLVMEmbeddedToolchainForArm-16.0.0-Linux-x86_64/bin:$PATH"' >> /home/arm_mlops_docker/.bashrc
chown -R arm_mlops_docker /home/arm_mlops_docker/LLVMEmbeddedToolchainForArm-16.0.0-Linux-x86_64