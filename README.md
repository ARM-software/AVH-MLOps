# Foundation Components for MLOps Systems

Arm provides a set of foundation tools and software components to enable MLOps systems and the overall development flow for machine learning applications. 
This repository contains:

- Setup of a Docker container with foundation tools for MLOps systems.
- A template project `MLOps.csolution.yml`. It uses a compiler to create a library with a trained ML model. The ML model performance is measured using Arm Virtual Hardware (AVH) FVP Models. 
- An example that shows the usage of the foundation components.
 
Refer to the [**Cortex-M and Ethos-U ML Developer Guide**](https://developer.arm.com/documentation/109267/latest/) for more information.

## Arm Tools Artifactory

To facilitate tool integration Arm provides critical foundation tools in a tools artifactory. The following tools are installed in the Docker container. In addition utilities such as CMake are installed.

URL / Tool     | Description
:--------------|:-------------------
[artifacts.keil.arm.com/avh/](https://artifacts.keil.arm.com/avh/)                      | [Arm Virtual Hardware FVP Models](https://arm-software.github.io/AVH/main/simulation/html/Using.html)
[artifacts.keil.arm.com/cmsis-toolbox/](https://artifacts.keil.arm.com/cmsis-toolbox/)  | [CLI Build System for CMSIS-Pack based projects](https://github.com/Open-CMSIS-Pack/cmsis-toolbox/blob/main/docs/README.md#cmsis-toolbox)
[artifacts.keil.arm.com/arm-compiler/](https://artifacts.keil.arm.com/arm-compiler/)      | [Arm Compiler for Embedded](https://developer.arm.com/Tools%20and%20Software/Arm%20Compiler%20for%20Embedded) (commercial)
[artifacts.keil.arm.com/arm-compiler/arm-none-eabi-gcc/](https://artifacts.keil.arm.com/arm-compiler/arm-none-eabi-gcc/) | [Arm GNU Toolchain](https://developer.arm.com/Tools%20and%20Software/GNU%20Toolchain) (community supported); not recommended for Cortex-M with Helium
[artifacts.keil.arm.com/arm-compiler/arm-llvm/](https://artifacts.keil.arm.com/arm-compiler/arm-none-eabi-gcc/) | [Arm LLVM Embedded Toolchain](https://learn.arm.com/install-guides/llvm-embedded/) (community supported)
