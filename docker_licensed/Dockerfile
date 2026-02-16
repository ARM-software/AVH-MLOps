ARG BASE_IMAGE
FROM ${BASE_IMAGE} as base

USER arm_mlops_docker
SHELL ["/bin/bash", "-c"]

ADD arm_mlops_docker_license* /

WORKDIR /vcpkg

RUN . /load_env.sh && \ 
    if [ -f /arm_mlops_docker_license ]; then \
      /opt/armlm/bin/armlm import --file /arm_mlops_docker_license; \
    else \
      /opt/armlm/bin/armlm activate -product KEMDK-COM0 -server https://mdk-preview.keil.arm.com; \
    fi

# Add /load_env.sh /vcpkg/env.json to .bashrc
RUN echo ". /load_env.sh /vcpkg/" >> ~/.bashrc 

WORKDIR /workspace

FROM base