wget https://artifacts.keil.arm.com/arm-none-eabi-gcc/12.3.1/arm-gnu-toolchain-x86_64-arm-none-eabi.tar.bz2 -nv
tar -xjf arm-gnu-toolchain-x86_64-arm-none-eabi.tar.bz2 -C /home/arm_mlops_docker
echo 'export PATH="$PATH:/home/arm_mlops_docker/arm-gnu-toolchain-x86_64-arm-none-eabi/bin"' >> /home/arm_mlops_docker/.bashrc
chown -R arm_mlops_docker /home/arm_mlops_docker/arm-gnu-toolchain-x86_64-arm-none-eabi