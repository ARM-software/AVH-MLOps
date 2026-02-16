FROM --platform=linux/amd64 ubuntu:latest as base

SHELL ["/bin/bash", "-c"]

# Install necessary packages
RUN apt-get update && apt-get install -y curl jq git zip unzip tar sudo software-properties-common 

# Install VSI extensions related system packages for Arm FVPs
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install -y libpython3.9 libatomic1 && \
    rm -rf /var/lib/apt/lists/*

# Create a user `arm_mlops_docker` with sudo privileges
RUN useradd -m arm_mlops_docker && echo "arm_mlops_docker:arm_mlops_docker" | chpasswd && adduser arm_mlops_docker sudo 

# Ensure sudo group users are not asked for a password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /vcpkg

USER arm_mlops_docker

# Adjust ownership and permissions before copying
COPY --chown=arm_mlops_docker:arm_mlops_docker load_env.sh /load_env.sh 
RUN chmod +x /load_env.sh 
COPY --chown=arm_mlops_docker:arm_mlops_docker set_env.sh /set_env.sh
RUN chmod +x /set_env.sh 
COPY --chown=arm_mlops_docker:arm_mlops_docker runops /usr/bin/runops
RUN chmod +x /usr/bin/runops 

COPY --chown=arm_mlops_docker:arm_mlops_docker install_vela.sh ./install_vela.sh
RUN chmod +x ./install_vela.sh
RUN sudo ./install_vela.sh 

COPY --chown=arm_mlops_docker:arm_mlops_docker install_armlm.sh ./install_armlm.sh
RUN chmod +x ./install_armlm.sh
RUN sudo ./install_armlm.sh 

COPY --chown=arm_mlops_docker:arm_mlops_docker install_vcpkg.sh ./install_vcpkg.sh
RUN chmod +x ./install_vcpkg.sh
RUN sudo ./install_vcpkg.sh 
RUN sudo chown -R arm_mlops_docker:arm_mlops_docker /usr/local/share/vcpkg /vcpkg /tmp/vcpkg
RUN sudo chmod -R 777 /usr/local/share /vcpkg /tmp/vcpkg

# Create/update all vcpkg registries
RUN vcpkg x-update-registry --all

# Add vcpkg-config.json to the image 
COPY --chown=arm_mlops_docker:arm_mlops_docker vcpkg-configuration.json /vcpkg/vcpkg-configuration.json

# Activate initial vcpkg environment
RUN vcpkg activate --downloads-root=. --json=env.json

ENV BASH_ENV "$HOME/.bashrc"

WORKDIR /workspace

FROM base
