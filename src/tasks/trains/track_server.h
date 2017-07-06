#ifndef TRACK_SERVER_H
#define TRACK_SERVER_H

#define TRACK_SERVER_NAME "TRACK"

#include "trains/track.h"

typedef enum TrackServerMessageType {
    TSMT_SENSOR_DOWN,
    TSMT_SENSOR_UP,
    TSMT_SWITCH_FLIP
} TrackServerMessageType;

// This is what you get when you register. NOT when you wait.
struct TrackServerMessage {
    TrackServerMessageType type;
    union {
        switch_state switches;
        struct Sensor sensor;
    } data;
};

// -1 => any train
void registerForSensorDown(int tid, int train);
void registerForSensorUp(int tid, int train);
void registerForSwitch(int tid);

void unregisterForSensorDown(int tid, int train);
void unregisterForSensorUp(int tid, int train);
void unregisterForSwitch(int tid);

struct Sensor waitForSensorDown(int tid, int train);
struct Sensor waitForSensorUp(int tid, int train);
switch_state waitForSwitch(int tid);

int querySwitch(int tid, int sw);

void notifySwitch(int tid, int sw, int isCurved);

#endif /* TRACK_SERVER_H */
