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
#define S_NONE (struct Sensor){SG_N,0}

#define S_ID(X) (((int)((X).group) << 4) | (X).id)

#define S_MAKE(A,B) (struct Sensor){#A[0] - 'A', B - 1}

#define S_FROM(A,B) (struct Sensor){(A) - 'A', B - 1}

#define S_INDEX(A,B) S_ID(S_FROM(A,B))

#define S_MID(X) (struct Sensor){ (X) / 16, (X) % 16 }

#define S_PRINT(X) (X).group + 'A', (X).id + 1

#define SID_PRINT(X) (X) / 16 + 'A', (X) % 16 + 1

#define S_EQUAL(A,B) ((A).group == (B).group && (A).id == (B).id && (A).group != SG_N)

void setSensorTrack(int isA);
struct Sensor getPrevSensor(struct Sensor src, switch_state switches);
struct Sensor getNextSensor(struct Sensor src, switch_state switches);
struct Sensor getReverseSensor(struct Sensor src);
int getDistanceToNext(struct Sensor src, switch_state switches);
int getDistanceFromPrev(struct Sensor src, switch_state switches);
struct Sensor parseSensor(const char *str);

#endif /* SENSORS_H */
