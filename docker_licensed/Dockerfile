ARG BASE_IMAGE
FROM ${BASE_IMAGE} as base

ADD arm_mlops_docker_license* /arm_mlops_docker_license*
RUN if [ -f /arm_mlops_docker_license ]; then \
    su -l arm_mlops_docker -c "/home/arm_mlops_docker/ArmCompilerforEmbedded6.20/bin/armlm import --file /arm_mlops_docker_license"; \
    else \
    /home/arm_mlops_docker/ArmCompilerforEmbedded6.20/bin/armlm activate -product KEMDK-COM0 -server https://mdk-preview.keil.arm.com; \
    fi

FROM base