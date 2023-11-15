# MLEK Keyword Spotting (KWS)

Base Directory: `mlek-kws`

## Solution

| solution-name | solution YML                                           |
|:--------------|:-------------------------------------------------------|
| MLOps         | [MLOps.csolution.yml](MLOps.csolution.yml)             |

## Projects

| project-name  | project YML                                            |
|:--------------|:-------------------------------------------------------|
| ML_Model      | [ML_Model.cproject.yml](Model/ML_Model.cproject.yml)   |
| ML_Test       | [ML_Test.cproject.yml](Test/ML_Test.cproject.yml)      |

## Target types

| target-type | Target processor          | model-executable               |
|:------------|:--------------------------|:-------------------------------|
| CM4         | Cortex-M4                 | FVP_MPS2_Cortex-M4             |
| CM4_FP      | Cortex-M4_FP              | FVP_MPS2_Cortex-M4             |
| CM7         | Cortex-M7                 | FVP_MPS2_Cortex-M7             |
| CM33        | Cortex-M33                | FVP_MPS2_Cortex-M33            |
| CM55        | Cortex-M55                | FVP_Corstone_SSE-300           |
| CM85        | Cortex-M85                | FVP_Corstone_SSE-310           |
| CM55_Ethos  | Cortex-M55 with Ethos-U55 | FVP_Corstone_SSE-300_Ethos-U55 |
| CM85_Ethos  | Cortex-M85 with Ethos-U65 | FVP_Corstone_SSE-310_Ethos-U65 |

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
| GCC (default) |

## Build

Build command syntax:

`cbuild MLOps.csolution.yml [--context [<project-name>][.<build-type>][+<target-type>]] [--toolchain <toolchain>]`

Examples:

- Build Model for Cortex-M7 with AC6 (size)
  ```sh
  cbuild MLOps.csolution.yml --context ML_Model.size+CM7 --toolchain AC6
  ```
- Build Test for Cortex-M7 with AC6 (size)
  ```sh
  cbuild MLOps.csolution.yml --context ML_Test.size+CM7 --toolchain AC6
  ```
- Build Model and Test for Cortex-M7 with AC6 (size)
  ```sh
  cbuild MLOps.csolution.yml --context .size+CM7 --toolchain AC6
  ```
- Build Model and Test for Cortex-M7 with AC6 (size, size, speed)
  ```sh
  cbuild MLOps.csolution.yml --context +CM7 --toolchain AC6
  ```
- Build Model and Test for all cores with GCC (size, size, speed)
  ```sh
  cbuild MLOps.csolution.yml
  ```

## Run Test

Run command syntax:

`<model-executable> -f ./Target/<target_type>/fvp_config.txt ./out/ML_test/<target-type>/<build-type>/ML_Test.axf`

Examples:

- Run Test on model for Cortex-M7 (size)
```sh
FVP_MPS2_Cortex-M7 -f ./Target/CM7/fvp_config.txt ./out/ML_Test/CM7/size/ML_Test.axf
```
- Run Test on model for Cortex-M55 with Ethos (size)
```sh
FVP_Corstone_SSE-300_Ethos-U55 -f ./Target/CM55_Ethos/fvp_config.txt ./out/ML_Test/CM55_Ethos/size/ML_Test.axf
```

## Show Test timing

Command syntax:

```sh
eventlist -s EventRecorder.log
```
