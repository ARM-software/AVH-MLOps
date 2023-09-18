/*---------------------------------------------------------------------------
 * Copyright (c) 2023 Arm Limited (or its affiliates). All rights reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *---------------------------------------------------------------------------*/

#include <stdio.h>

#include "RTE_Components.h"
#include  CMSIS_device_header
#include "EventRecorder.h"
#include "cmsis_os2.h"

#include "main.h"

const char *qx_predict_classes[] = {"REST", "SHAKE", "WAVE"};

static void __NO_RETURN app_main (void *argument) {
  (void)argument;
  int cur_ts, old_ts;
  int prediction;

  old_ts = 0U;
  while(1) {
    prediction = QxAutoMLWork();
    cur_ts = osKernelGetTickCount();
    if ((cur_ts - old_ts) >= PRED_CLASSIFICATION_INTERVAL_IN_MSECS) {
      printf("TS: %d Prediction: %d - %s\r\n", cur_ts, prediction, qx_predict_classes[prediction]);
      old_ts = cur_ts;
    }
  }
}

int main (void) {
  // System Initialization
  SystemCoreClockUpdate();

  EventRecorderInitialize(EventRecordAll, 1U);

  osKernelInitialize();                 // Initialize CMSIS-RTOS2
  osThreadNew(app_main, NULL, NULL);    // Initialize application
  osKernelStart();                      // Start thread execution

  for (;;) {}
}
