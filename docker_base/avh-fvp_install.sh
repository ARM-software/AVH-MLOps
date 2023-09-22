wget https://artifacts.keil.arm.com/avh/11.21.15/avh-fvp-cortex-m-linux-amd64.tar.bz2 -nv
mkdir /home/arm_mlops_docker/avh-fvp-11.21.15
tar -xvf avh-fvp-cortex-m-linux-amd64.tar.bz2 -C /home/arm_mlops_docker/avh-fvp-11.21.15
chmod 0755 /home/arm_mlops_docker/avh-fvp-11.21.15 -R
