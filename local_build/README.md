For various reasons, like debugging CI flows or customized images, you may want to run local instances of the MLOps containers. 

To locally build the container onto a desktop machine:

- Check out the repository

- Make sure Docker engine is installed: https://docs.docker.com/engine/install/

- Build the base image: \
``` docker build -t arm-mlops-docker-base:latest -f ./docker_base/Dockerfile ./docker_base --platform=linux/amd64```
- Run and instance of the image in a container: \
``` docker run -d --name build_container -u root -v .:/workspace --platform=linux/amd64 arm-mlops-docker-base:latest sleep infinity ```
- Export your license to be imported in the container image using the Arm License Manager in the running container: \
``` docker exec build_container /home/arm_mlops_docker/ArmCompilerforEmbedded6.20/bin/armlm activate --code **your-license-code**  --as-user arm_mlops_docker --to-file /workspace/arm_mlops_docker_license ```
- Copy exported license to build folder: \
``` cp ./arm_mlops_docker_license ./docker_licensed/arm_mlops_docker_license```
- Build an image based on the base image, adding the license. This needs to be rebuild whenever the license expires: \
 ``` docker build -t arm-mlops-docker-licensed:latest -f ./docker_licensed/Dockerfile ./docker_licensed --build-arg BASE_IMAGE=arm-mlops-docker-base  --platform=linux/amd64 ```
- Run an instance of the image: \
``` docker run -d --name local_arm_mlops_container -u root -v .:/workspace --platform=linux/amd64 arm-mlops-docker-licensed:latest ```
- Test if the Arm Compiler can be executed and displays your license: \
```docker exec local_arm_mlops_container su -l arm_mlops_docker -c "/home/arm_mlops_docker/ArmCompilerforEmbedded6.20/bin/armclang --version"```