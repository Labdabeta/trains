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
    switch_state switches;
};

void initTrackA(struct Track *track);
void initTrackB(struct Track *track);

/* Returns the trains new id. */
int addTrain(struct Track *track, int id, struct Sensor location);

/* Returns which train must have flipped the sensor. */
int saveSensorFlip(struct Track *track, struct Sensor sensor, int time);
int saveSensorUnflip(struct Track *track, struct Sensor sensor, int time);
void saveSwitchFlip(struct Track *track, int sw, int isCurved);

#endif /* TRACK_H */
