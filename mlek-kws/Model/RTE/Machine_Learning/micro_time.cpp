/* Copyright 2022 The TensorFlow Authors. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/

#include "tensorflow/lite/micro/micro_time.h"

#if defined(SSE_300_MPS3) || defined(SSE_310_MPS3)

#define DWT_CTRL         (*((volatile uint32_t*)0xE0001000))
#define DWT_CYCCNT       (*((volatile uint32_t*)0xE0001004))
#define CoreDebug_DEMCR  (*((volatile uint32_t*)0xE000EDFC))

#define CoreDebug_DEMCR_TRCENA_Msk (1UL << 24)

namespace tflite {

uint32_t ticks_per_second() { return 0; }

uint32_t GetCurrentTimeTicks() {
  static bool is_initialized = false;

  if (!is_initialized) {
    CoreDebug_DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;

    // Reset and DWT cycle counter.
    DWT_CYCCNT = 0;
    DWT_CTRL|= 1UL;

    is_initialized = true;
  }

  return DWT_CYCCNT;
}

}  // namespace tflite

#else

// Set in micro/tools/make/targets/cortex_m_generic_makefile.inc.
// Needed for the DWT and PMU counters.
#include "RTE_Components.h"
#include CMSIS_device_header

namespace tflite {

uint32_t ticks_per_second() { return 0; }

uint32_t GetCurrentTimeTicks() {
  static bool is_initialized = false;

  if (!is_initialized) {
#if (!defined(TF_LITE_STRIP_ERROR_STRINGS) && !defined(ARMCM0) && \
     !defined(ARMCM0plus))
#ifdef ARM_MODEL_USE_PMU_COUNTERS
    ARM_PMU_Enable();
    DCB->DEMCR |= DCB_DEMCR_TRCENA_Msk;

    ARM_PMU_CYCCNT_Reset();
    ARM_PMU_CNTR_Enable(PMU_CNTENSET_CCNTR_ENABLE_Msk);

#else
#ifdef ARMCM7
    DWT->LAR = 0xC5ACCE55;
#endif
    CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;

    // Reset and DWT cycle counter.
    DWT->CYCCNT = 0;
    DWT->CTRL |= 1UL;

#endif
#endif

    is_initialized = true;
  }

#if (!defined(TF_LITE_STRIP_ERROR_STRINGS) && !defined(ARMCM0) && \
     !defined(ARMCM0plus))
#ifdef ARM_MODEL_USE_PMU_COUNTERS
  return ARM_PMU_Get_CCNTR();
#else
  return DWT->CYCCNT;
#endif
#else
  return 0;
#endif
}

}  // namespace tflite

#endif
