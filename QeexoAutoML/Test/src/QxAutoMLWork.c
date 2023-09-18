/**
  ******************************************************************************
  * @file    QxAutoMLWork.c
  * @author  Qeexo Kernel Development team
  * @version V1.0.0
  * @date    30-Sep-2020
  * @brief   Auto ML module for Inference 
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2020 Qeexo Co.
  * All rights reserved
  *
  *
  * ALL INFORMATION CONTAINED HEREIN IS AND REMAINS THE PROPERTY OF QEEXO, CO.
  * THE INTELLECTUAL AND TECHNICAL CONCEPTS CONTAINED HEREIN ARE PROPRIETARY TO
  * QEEXO, CO. AND MAY BE COVERED BY U.S. AND FOREIGN PATENTS, PATENTS IN PROCESS,
  * AND ARE PROTECTED BY TRADE SECRET OR COPYRIGHT LAW. DISSEMINATION OF
  * THIS INFORMATION OR REPRODUCTION OF THIS MATERIAL IS STRICTLY FORBIDDEN UNLESS
  * PRIOR WRITTEN PERMISSION IS OBTAINED OR IS MADE PURSUANT TO A LICENSE AGREEMENT
  * WITH QEEXO, CO. ALLOWING SUCH DISSEMINATION OR REPRODUCTION.
  *
  ******************************************************************************
 */

#include "sensor_data.h"
#include "QxAutoMLUser.h"

#define ACCELEROMETER_READ_SAMPLES      4U
#define GYROSCOPE_READ_SAMPLES          4U

#define ACCELEROMETER_SAMPLE_SIZE       6U
#define GYROSCOPE_SAMPLE_SIZE           6U

/* Customer Native Fucntions*/
extern void NativeInitSensor(void);
extern void NativeOSDelay(int msec);
extern int  NativeOSGetTick(void);

static void QxFillDataFrame()
{
    unsigned short data_len;
    unsigned short data_bits;

    void* data;

/* Fill Accel data if it is enabled in static engine library */
#ifdef QXAUTOMLCONFIG_SENSOR_ENABLE_ACCEL
    static const unsigned char *p_accelerometer_data = accelerometer_data;

    data = (void *)p_accelerometer_data;
    data_len = ACCELEROMETER_READ_SAMPLES * ACCELEROMETER_SAMPLE_SIZE;
    QxFillSensorData(QXSENSOR_TYPE_ACCEL, data, data_len);
    p_accelerometer_data += data_len;
    if ((p_accelerometer_data - &accelerometer_data[0]) >= accelerometer_data_len) {
        p_accelerometer_data = &accelerometer_data[0];
    }
#endif

/* Fill Gryo data if it is enabled in static engine library */
#ifdef QXAUTOMLCONFIG_SENSOR_ENABLE_GYRO
    static const unsigned char *p_gyroscope_data = gyroscope_data;

    data = (void *)p_gyroscope_data;
    data_len = GYROSCOPE_READ_SAMPLES * GYROSCOPE_SAMPLE_SIZE;
    QxFillSensorData(QXSENSOR_TYPE_GYRO, data, data_len);
    p_gyroscope_data += data_len;
    if ((p_gyroscope_data - &gyroscope_data[0]) >= gyroscope_data_len) {
        p_gyroscope_data = &gyroscope_data[0];
    }
#endif

/* Fill Magnetic data if it is enabled in static engine library */
#ifdef QXAUTOMLCONFIG_SENSOR_ENABLE_MAG
    QxFillSensorData(QXSENSOR_TYPE_MAG, data, data_len);
#endif

/* Fill Microphone data if it is enabled in static engine library */
#ifdef QXAUTOMLCONFIG_SENSOR_ENABLE_MICROPHONE
    QxFillSensorData(QXSENSOR_TYPE_MICROPHONE, data, data_len);
#endif
}

int QxAutoMLWork()
{
    static int time_sum = 0;
    static int result = -1;

    /* Qeexo AutoML work interval user fixed 10ms */
    int work_interval = 10;

    /* Customer implement this API to initialize device sensor at the first time be called */
    /* After private pointer variables is assigned, we call this function
    to init any sensors that are used by current static classify engine library. */
    NativeInitSensor();

    /* Get current tick in ms */
    int tick = NativeOSGetTick();

    QxFillDataFrame();

    time_sum += 10;
    if (time_sum >= PRED_CLASSIFICATION_INTERVAL_IN_MSECS) { 
        /* Call classify periodically each pred_interval */
        result = QxClassify();
        time_sum = 0; 
    }

    int diff = NativeOSGetTick() - tick;

    if(diff < work_interval) {
        NativeOSDelay(work_interval - diff);
    }

    return result;
}
