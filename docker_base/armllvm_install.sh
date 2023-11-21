wget https://github.com/ARM-software/LLVM-embedded-toolchain-for-Arm/releases/download/release-17.0.1/LLVMEmbeddedToolchainForArm-17.0.1-Linux-AArch64.tar.xz
 -nv
tar -xf LLVMEmbeddedToolchainForArm-17.0.1-Linux-AArch64.tar.xz -C /home/arm_mlops_docker
apt install -y libtinfo5
#echo 'export "/home/arm_mlops_docker/LLVMEmbeddedToolchainForArm-16.0.0-Linux-x86_64/bin:$PATH"' >> /home/arm_mlops_docker/.bashrc
chown -R arm_mlops_docker /home/arm_mlops_docker/LLVMEmbeddedToolchainForArm-17.0.1-Linux-AArch64
