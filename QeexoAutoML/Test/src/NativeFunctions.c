#include "cmsis_os2.h"

/* Native Functions */

void NativeInitSensor(void) {}

void NativeOSDelay(int msec) {
  osDelay((uint32_t)msec);
}

int NativeOSGetTick(void) {
  uint32_t tick;

  tick = osKernelGetTickCount();

  return (int)tick;
}
