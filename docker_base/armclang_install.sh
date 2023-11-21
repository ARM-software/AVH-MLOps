wget https://artifacts.keil.arm.com/arm-compiler/6.20/21/standalone-linux-armv8l_64-rel.tgz  -nv
mkdir ./ArmCompilerforEmbedded6.20
tar xvfz ./standalone-linux-armv8l_64-rel.tgz  -C ./ArmCompilerforEmbedded6.20
chown -R arm_mlops_docker ./ArmCompilerforEmbedded6.20
