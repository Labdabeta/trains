#ifndef TRACK_SERVER_H
#define TRACK_SERVER_H

#define TRACK_SERVER_NAME "TRACK"
#define TRACK_MESSAGE_ID 0x712AC1C

#include "trains/track.h"

typedef enum TrackServerMessageType {
    TSMT_SENSOR_DOWN,
    TSMT_SENSOR_UP,
    TSMT_SWITCH_FLIP,
    TSMT_NONE
} TrackServerMessageType;

// This is what you get when you register. NOT when you wait.
struct TrackServerMessage {
    int msgid; // will be TRACK_MESSAGE_ID
    TrackServerMessageType type;
    union {
        struct {
            switch_state switches;
            int change_id;
            int isCurved;
        } sw;
        struct {
            struct Sensor sensor;
            int train; // or -1 for unknown
        } sensor;
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
int querySensor(int tid, struct Sensor sen);
struct Sensor lastKnownLocation(int tid, int train); // returns S_NONE if unknown

void insertTrain(int tid, int train, struct Sensor sensor);

// Also flips it!
void notifySwitch(int tid, int sw, int isCurved);

#endif /* TRACK_SERVER_H */
