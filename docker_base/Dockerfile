FROM --platform=linux/amd64 ubuntu:latest as base

RUN  apt-get update && apt-get install -y wget sudo software-properties-common && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash arm_mlops_docker
WORKDIR /home/arm_mlops_docker
ARG DEBIAN_FRONTEND=noninteractive

ADD armclang_install.sh /armclang_install.sh
RUN chmod +x /armclang_install.sh && /armclang_install.sh
ADD vela_install.sh /vela_install.sh
RUN chmod +x /vela_install.sh && /vela_install.sh
ADD avh-fvp_install.sh /avh-fvp_install.sh
RUN chmod +x /avh-fvp_install.sh && /avh-fvp_install.sh
ADD armllvm_install.sh /armllvm_install.sh
RUN chmod +x /armllvm_install.sh && /armllvm_install.sh
#ADD armgcc_install.sh /armgcc_install.sh
#RUN chmod +x /armgcc_install.sh && /armgcc_install.sh
ADD cmsistoolbox_install.sh /cmsistoolbox_install.sh
RUN chmod +x /cmsistoolbox_install.sh && /cmsistoolbox_install.sh

FROM base
