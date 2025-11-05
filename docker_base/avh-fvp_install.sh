wget https://artifacts.tools.arm.com/avh/11.29.27/avh-linux-x86_11.29_27_Linux64.tgz -nv
mkdir /home/arm_mlops_docker/avh-fvp-11.29.27
tar -xzf avh-linux-x86_11.29_27_Linux64.tgz -C /home/arm_mlops_docker/avh-fvp-11.29.27 --strip-components=1
rm /home/arm_mlops_docker/avh-fvp-11.29.27/avh-linux-x86/bin/models/libpython3.9.so.1.0
chmod 0755 /home/arm_mlops_docker/avh-fvp-11.29.27 -R
