wget https://github.com/ARM-software/LLVM-embedded-toolchain-for-Arm/releases/download/release-16.0.0/LLVMEmbeddedToolchainForArm-16.0.0-Linux-AArch64.tar.gz -nv
tar -xf LLVMEmbeddedToolchainForArm-16.0.0-Linux-AArch64.tar.gz -C $HOME
export PATH=$HOME/LLVMEmbeddedToolchainForArm-16.0.0-Linux-AArch64/bin:$PATH
apt install -y libtinfo5
