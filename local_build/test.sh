# Test if a project can be compiled and executed             
docker exec local_arm_mlops_container wget -P /home/arm_mlops_docker https://github.com/ARM-software/CMSIS_6/releases/download/dev%2Fv6.0.0-dev35/ARM.CMSIS.6.0.0-dev35+geb1d42a.pack -nv
docker exec local_arm_mlops_container su -l arm_mlops_docker -c "/home/arm_mlops_docker/cmsis-toolbox-linux-amd64/bin/cpackget add ARM.CMSIS.6.0.0-dev35+geb1d42a.pack --agree-embedded-license"
docker exec local_arm_mlops_container wget -P /home/arm_mlops_docker https://github.com/ARM-software/Cortex_DFP/releases/download/dev%2Fv1.0.0-dev15/ARM.Cortex_DFP.1.0.0-dev15+gf6802e4.pack -nv
docker exec local_arm_mlops_container su -l arm_mlops_docker -c "/home/arm_mlops_docker/cmsis-toolbox-linux-amd64/bin/cpackget add ARM.Cortex_DFP.1.0.0-dev15+gf6802e4.pack --agree-embedded-license"

docker exec local_arm_mlops_container su - arm_mlops_docker -c "/home/arm_mlops_docker/cmsis-toolbox-linux-amd64/bin/cbuild /workspace/mlek-kws/MLOps.csolution.yml --packs --context +CM4 --toolchain AC6"
docker exec local_arm_mlops_container su - arm_mlops_docker -c "LD_LIBRARY_PATH=/home/arm_mlops_docker/avh-fvp-11.21.15/avh-fvp-cortex-m-linux-amd64/bin/ /home/arm_mlops_docker/avh-fvp-11.22.39/avh-linux-x86/bin/FVP_MPS2_Cortex-M4 -f /workspace/TFLmicrospeech/Target/CM4/fvp_config.txt /workspace/mlek-kws/out/ML_Test/CM4/size/ML_Test.axf --simlimit 12"
