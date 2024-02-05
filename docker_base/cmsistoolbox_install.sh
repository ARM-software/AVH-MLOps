wget https://artifacts.tools.arm.com/cmsis-toolbox/2.1.0/cmsis-toolbox-linux-amd64.tar.gz -nv
wget https://github.com/Kitware/CMake/releases/download/v3.27.4/cmake-3.27.4-linux-x86_64.sh -nv
tar -xf cmsis-toolbox-linux-amd64.tar.gz -C /home/arm_mlops_docker
chmod +x cmake-3.27.4-linux-x86_64.sh
mkdir /home/arm_mlops_docker/cmake
./cmake-3.27.4-linux-x86_64.sh --skip-license --prefix=/home/arm_mlops_docker/cmake
mkdir /home/arm_mlops_docker/ninja
wget -qO /home/arm_mlops_docker/ninja/ninja.gz https://github.com/ninja-build/ninja/releases/latest/download/ninja-linux.zip -nv
gunzip /home/arm_mlops_docker/ninja/ninja.gz 
chmod a+x /home/arm_mlops_docker/ninja/ninja 
echo 'export AC6_TOOLCHAIN_6_20_1=/home/arm_mlops_docker/ArmCompilerforEmbedded6.20/bin' >> /home/arm_mlops_docker/.bashrc
echo 'export CMSIS_PACK_ROOT=/home/arm_mlops_docker/packs' >> /home/arm_mlops_docker/.bashrc
echo 'export CMSIS_COMPILER_ROOT=/home/arm_mlops_docker/cmsis-toolbox-linux-amd64/etc' >> /home/arm_mlops_docker/.bashrc
echo 'export PATH=/home/arm_mlops_docker/cmake/bin:$PATH' >> /home/arm_mlops_docker/.bashrc
echo 'export PATH=/home/arm_mlops_docker/cmsis-toolbox-linux-amd64/bin:$PATH' >> /home/arm_mlops_docker/.bashrc
echo 'AC6_TOOLCHAIN_6_20_1="/home/arm_mlops_docker/ArmCompilerforEmbedded6.20/bin"' >> /etc/environment
echo 'CMSIS_PACK_ROOT="/home/arm_mlops_docker/packs"' >> /etc/environment
echo 'CMSIS_COMPILER_ROOT="/home/arm_mlops_docker/cmsis-toolbox-linux-amd64/etc"' >> /etc/environment
echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin//home/arm_mlops_docker/cmsis-toolbox-linux-amd64/bin:/home/arm_mlops_docker/cmake/bin:/home/arm_mlops_docker/ninja:/home/arm_mlops_docker/ArmCompilerforEmbedded6.20/bin"' >> /etc/environment
export AC6_TOOLCHAIN_6_20_1=/home/arm_mlops_docker/ArmCompilerforEmbedded6.20/bin
export CMSIS_PACK_ROOT=/home/arm_mlops_docker/packs
export CMSIS_COMPILER_ROOT=/home/arm_mlops_docker/cmsis-toolbox-linux-amd64/etc
export PATH=/home/arm_mlops_docker/cmsis-toolbox-linux-amd64/bin:$PATH
export PATH=/home/arm_mlops_docker/cmake/bin:$PATH
export PATH=/home/arm_mlops_docker/ninja:$PATH
cpackget init https://www.keil.com/pack/index.pidx
chown -R arm_mlops_docker /home/arm_mlops_docker
