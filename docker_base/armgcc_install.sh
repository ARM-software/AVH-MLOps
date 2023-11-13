wget https://artifacts.keil.arm.com/arm-none-eabi-gcc/12.3.1/arm-gnu-toolchain-x86_64-arm-none-eabi.tar.bz2 -nv
tar -xf arm-gnu-toolchain-x86_64-arm-none-eabi.tar.bz2 -C /home/arm_mlops_docker
chown -R arm_mlops_docker /home/arm_mlops_docker/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi/