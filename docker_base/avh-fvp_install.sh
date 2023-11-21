wget https://artifacts.keil.arm.com/avh/11.22.39/avh-fvp-linux-arm64.tar.gz -nv
mkdir /home/arm_mlops_docker/avh-fvp-11.22.39
tar -xvf avh-fvp-linux-arm64.tar.gz -C /home/arm_mlops_docker/avh-fvp-11.22.39
rm /home/arm_mlops_docker/avh-fvp-11.22.39/avh-linux-aarch64/bin/models/libpython3.9.so.1.0
chmod 0755 /home/arm_mlops_docker/avh-fvp-11.22.39 -R
