wget https://artifacts.tools.arm.com/arm-none-eabi-gcc/12.3.1/arm-gnu-toolchain-x86_64-arm-none-eabi.tar.bz2 -nv
apt-get install -y --no-install-recommends bzip2
tar -xf arm-gnu-toolchain-x86_64-arm-none-eabi.tar.bz2 -C /home/arm_mlops_docker
chown -R arm_mlops_docker /home/arm_mlops_docker/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi/
