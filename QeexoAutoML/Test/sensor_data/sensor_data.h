#ifndef SENSOR_DATA_H
#define SENSOR_DATA_H 1

#ifdef __cplusplus
extern "C" {
#endif

extern unsigned int accelerometer_data_len;
extern unsigned int gyroscope_data_len;

extern const unsigned char accelerometer_data[];
extern const unsigned char gyroscope_data[];

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* SENSOR_DATA_H */
