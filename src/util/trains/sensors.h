#ifndef SENSORS_H
#define SENSORS_H

#include "trains/switches.h"

#define SENSOR_MAX 80

typedef enum SensorGroup { SG_A = 0, SG_B, SG_C, SG_D, SG_E, SG_N } SensorGroup;

struct Sensor {
    SensorGroup group; /* SG_A -> SG_E */
    unsigned int id : 4; /* 0 -> 15 */
} __attribute__((packed));

#define SG_NEXT(X) (((X) + 1) % 5)
#define SG_PREV(X) (((X) + 4) % 5)
#define S_NONE (struct Sensor){SG_N,-1}

#define S_NAME(X) ((char[]){ \
        'A' + (X).group, \
        ((X) > 8 ? 'A' + (X) - 9 : '1' + (X)), \
        0})

#define S_ID(X) (((int)((X).group) << 4) | (X).id)

#define S_MAKE(A,B) (struct Sensor){#A[0] - 'A', B - 1}

#define S_EQUAL(A,B) ((A).group == (B).group && (A).id == (B).id && (A).group != SG_N)

void setSensorTrack(int isA);
struct Sensor getPrevSensor(struct Sensor src, switch_state switches);
struct Sensor getNextSensor(struct Sensor src, switch_state switches);
struct Sensor getReverseSensor(struct Sensor src);
int getDistanceToNext(struct Sensor src, switch_state switches);
int getDistanceFromPrev(struct Sensor src, switch_state switches);

#endif /* SENSORS_H */
