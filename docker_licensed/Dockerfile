FROM ghcr.io/matthiashertel80/avh-mlops/arm-mlops-docker-base:latest as base

ADD arm_mlops_docker_license /arm_mlops_docker_license
RUN /home/arm_mlops_docker/ArmCompilerforEmbedded6.20/bin/armlm import --file /arm_mlops_docker_license

FROM base
