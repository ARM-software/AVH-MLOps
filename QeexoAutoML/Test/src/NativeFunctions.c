#include "cmsis_os2.h"
#include "EventRecorder.h"

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

void NativeMeasureStart(void) {
  EventStartCv(1, 0, 0);
}

void NativeMeasureStop(void) {
  EventStopCv(1, 0, 0);
}
