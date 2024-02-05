# Foundation Components for MLOps Systems

Arm provides a set of foundation tools and software components to enable MLOps systems and the overall development flow for machine learning applications. 
This repository contains:

- Setup of a Docker container with foundation tools for MLOps systems.
- GitHub Actions that demonstrate typical MLOps workflows such as:
  - Create a library with a trained ML model with different compilers and for different target processors
  - Measure performance (inference time) of an ML model using Arm Virtual Hardware (AVH) FVP Models.
 
Refer to the [**ML Developers Guide for Cortex-M Processors and Ethos-U NPU**](https://developer.arm.com/documentation/109267/latest/) for more information.

## Directory Structure

Directory           | Description
:-------------------|:------------------------------
[.github/workflows](./.github/workflows)           | GitHub Action workflow definitions.
[AVH-MLOps-main](./AVH-MLOps-main)                 | Simple "Hello World" test project with vcpkg installation for desktop usage.
[mlek-kws](./mlek-kws)                             | MLEK Keyword Spotting (KWS) example with generation of a ML Model library and execution on AVH. This project runs on all relevant Cortex-M and Ethos-U targets and can be compiled using different toolchains.
[QeexoAutoML](./QeexoAutoML)                       | Qeexo AutoML example with prebuilt ML library and test execution.
[TFLmicrospeech](./TFLmicrospeech)                 | TensorFLow Lite Microspeech example with ML library generation and test execution. This project runs on all relevant Cortex-M and Ethos-U targets and can be compiled using different toolchains.
[docker_base](./docker_base)                       | Docker base image with all tools (see Arm Tools Artifactory).
[docker_licensed](./docker_licensed)               | Import license file into the Docker base image.

## Arm Tools Artifactory

To facilitate tool integration Arm provides critical foundation tools in a tools artifactory. The following tools are installed in the Docker container. In addition utilities such as CMake are installed.

URL / Tool     | Description
:--------------|:-------------------
[artifacts.tools.arm.com/avh/](https://artifacts.tools.arm.com/avh/)                      | [Arm Virtual Hardware FVP Models](https://arm-software.github.io/AVH/main/simulation/html/Using.html)
[artifacts.tools.arm.com/cmsis-toolbox/](https://artifacts.tools.arm.com/cmsis-toolbox/)  | [CLI Build System for CMSIS-Pack based projects](https://github.com/Open-CMSIS-Pack/cmsis-toolbox/blob/main/docs/README.md#cmsis-toolbox)
[artifacts.tools.arm.com/arm-compiler/](https://artifacts.tools.arm.com/arm-compiler/)      | [Arm Compiler for Embedded](https://developer.arm.com/Tools%20and%20Software/Arm%20Compiler%20for%20Embedded) (commercial)
[artifacts.tools.arm.com/arm-none-eabi-gcc/](https://artifacts.tools.arm.com/arm-none-eabi-gcc/) | [Arm GNU Toolchain](https://developer.arm.com/Tools%20and%20Software/GNU%20Toolchain) (community supported); not recommended for Cortex-M with Helium
[github.com/ARM-software/LLVM-embedded-toolchain-for-Arm/](https://github.com/ARM-software/LLVM-embedded-toolchain-for-Arm/releases/latest/) | [Arm LLVM Embedded Toolchain](https://learn.arm.com/install-guides/llvm-embedded/) (community supported)

## Github Action workflow templates

Four workflows examplify a typical MLOps cycle with the Arm provided Foundation Components for MLOps.

**Base Docker Image - Build and Push (base_image_build.yml)**: Build a docker image that has all tools mentioned before installed and configured. It will be stored on the Github docker registry for fast access to the image.

**Licensed Docker Image - Build and Push (licensed_image_build.yml)**: Based on the Base docker image, this workflow adds your own license supplied by Arm for the commercial tools. It will also be stored on the Github docker registry. It will be build nightly and will be the image that actual container run-times will be spawned from.

**Licensed Docker Image - Test (test_licensed_image.yml)**: Test the docker image with a simplified workflow.

**ML Project - Build and Run on Arm Virtual Hardware FVP (build_ml_library.yml)**: More complex example of a end to end workflow from building a ML Library, test project and to execute it on Arm Virtual Hardware. 

## Customize this repository

First create a fork into a user account or organization of your own (or commit to a new private repository). On your fork you need to make a couple of modifications:

1. Add own Activation Code (Arm UBL license)
The activation code is passed to the docker build process in a Github Actions secret called ARM_UBL_LICENSE_IDENTIFIER.
To set a secret called ARM_UBL_LICENSE_IDENTIFIER to a repository in Github, go to the repository's main page, click on "Settings", then "Secrets", and "New repository secret". Enter "ARM_UBL_LICENSE_IDENTIFIER" as the name and the activation code for the Arm UBL license as the value. Click on "Add secret". 

2. Customize Base Docker Image
Additional installations for custom tools you can add those to docker_base/Dockerfile. If you are new to Docker find a good starting point in the [Docker manual](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/).

Check the Actions view to verify the execution of all 4 workflows.

## Known Issues

The following items are at this moment not completed:

- Consistent support for GCC and LLVM compiler. Currently only Arm Compiler 6 is supported.
- Multiple demo projects for VSI usage (Sensor, Audio, Video) will be added.
- Arm Virtual Models are not yet available for vcpkg installation; use classic MDK version 5 for using AVH models.
