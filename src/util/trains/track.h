#ifndef TRACK_H
#define TRACK_H

#include "trains/trains.h"
#include "trains/track_data.h"
#include "trains/sensors.h"
#include "trains/switches.h"

/* Utilities for managing the state of the track. */
struct Track {
    struct Sensor lastLocation[TRAIN_MAX];
    // There are 2 because it might be on either side of last switch sometimes
    struct Sensor nextLocation[TRAIN_MAX][2];
    int lastRegister[TRAIN_MAX];
    int realId[TRAIN_MAX];
    int speed[TRAIN_MAX]; // as 0->14
    int whenSpeed[TRAIN_MAX];
    int velocity[TRAIN_MAX][SPEED_MAX+1]; // in mm/sec
    int isData[TRAIN_MAX]; // 0 means that this datum would be useless
    switch_state switches;
};

struct Position {
    struct Sensor lastSensor;
    struct Sensor nextSensor[2];
    int distanceFromLast;
};

void initTrackA(struct Track *track);
void initTrackB(struct Track *track);

/* Returns the trains new id. */
int addTrain(struct Track *track, int id, struct Sensor location);

/* Returns which train must have flipped the sensor. */
int saveSensorFlip(struct Track *track, struct Sensor sensor, int time);
void saveSwitchFlip(struct Track *track, int sw, int isCurved);
void saveSpeedChange(struct Track *track, int train, int speed, int time);

struct Position getTrainPosition(const struct Track *track, int train, int time);
int getTrainVelocity(const struct Track *track, int train, int time);

#endif /* TRACK_H */
