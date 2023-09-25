# AVH MLOps Test

Base Directory: `AVH-MLOps-main`

## Solution

| solution-name | solution YML                                           |
|:--------------|:-------------------------------------------------------|
| MLOps         | [MLOps.csolution.yml](MLOps.csolution.yml)             |

## Project

| project-name  | project YML                                            |
|:--------------|:-------------------------------------------------------|
| ML_Test       | [ML_Test.cproject.yml](Test/ML_Test.cproject.yml)      |

## Target types

| target-type | Target processor          | model-executable               |
|:------------|:--------------------------|:-------------------------------|
| CM0         | Cortex-M0                 | VHT_MPS2_Cortex-M0             |
| CM0plus     | Cortex-M0+                | VHT_MPS2_Cortex-M0plus         |
| CM3         | Cortex-M3                 | VHT_MPS2_Cortex-M3             |
| CM4         | Cortex-M4                 | VHT_MPS2_Cortex-M4             |
| CM4_FP      | Cortex-M4_FP              | VHT_MPS2_Cortex-M4             |
| CM7         | Cortex-M7                 | VHT_MPS2_Cortex-M7             |
| CM23        | Cortex-M23                | VHT_MPS2_Cortex-M23            |
| CM33        | Cortex-M33                | VHT_MPS2_Cortex-M33            |
| CM55        | Cortex-M55                | VHT_MPS3_Corstone_SSE-300      |
| CM85        | Cortex-M85                | VHT_Corstone_SSE-310           |
| CM55_Ethos  | Cortex-M55 with Ethos-U55 | VHT_Corstone_SSE-300_Ethos-U55 |
| CM85_Ethos  | Cortex-M85 with Ethos-U65 | VHT_Corstone_SSE-310_Ethos-U65 |

## Build types

| build-type  |
|:------------|
| balanced    |
| size        |
| speed       |

## Toolchain

| toolchain     |
|:--------------|
| AC6           |
| CLANG         |
| GCC (default) |

## Build

Build command syntax:

`cbuild MLOps.csolution.yml [--context [<project-name>][.<build-type>][+<target-type>]] [--toolchain <toolchain>]`

Examples:

- Build Test for Cortex-M3 with AC6 (size)
  ```sh
  cbuild MLOps.csolution.yml --context ML_Test.size+CM3 --update-rte --toolchain AC6
  ```
- Build Test for Cortex-M3 with AC6 (size, size, speed)
  ```sh
  cbuild MLOps.csolution.yml --context +CM3 --update-rte --toolchain AC6
  ```
- Build Test for all cores with GCC (size, size, speed)
  ```sh
  cbuild MLOps.csolution.yml --update-rte
  ```

## Run Test

Run command syntax:

`<model-executable> -f ./Target/<target_type>/fvp_config.txt ./out/ML_test/<target-type>/<build-type>/ML_Test.axf`

Examples:

- Run Test on model for Cortex-M3 (size)
```sh
VHT_MPS2_Cortex-M3 -f ./Target/CM3/fvp_config.txt ./out/ML_Test/CM3/size/ML_Test.axf
```
- Run Test on model for Cortex-M55 with Ethos (size)
```sh
VHT_Corstone_SSE-300_Ethos-U55 -f ./Target/CM55_Ethos/fvp_config.txt ./out/ML_Test/CM55_Ethos/size/ML_Test.axf
```
