wget https://github.com/ARM-software/LLVM-embedded-toolchain-for-Arm/releases/download/release-19.1.5/LLVM-ET-Arm-19.1.5-Linux-x86_64.tar.xz -nv
tar -xf LLVM-ET-Arm-19.1.5-Linux-x86_64.tar.xz -C /home/arm_mlops_docker
apt install -y libtinfo5
#echo 'export "/home/arm_mlops_docker/LLVM-ET-Arm-19.1.5-Linux-x86_64/bin:$PATH"' >> /home/arm_mlops_docker/.bashrc
chown -R arm_mlops_docker /home/arm_mlops_docker/LLVM-ET-Arm-19.1.5-Linux-x86_64