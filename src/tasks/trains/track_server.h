#ifndef TRACK_SERVER_H
#define TRACK_SERVER_H

#define TRACK_SERVER_NAME "TRACK"

#include "track.h"

void registerForSensorDown(int tid, train_id train);
void registerForSensorUp(int tid, train_id train);
void registerForSwitch(int tid);
void waitForSensorDown(int tid, train_id train);
void waitForSensorUp(int tid, train_id train);
void waitForSwitch(int tid);
int querySwitch(int tid, int sw);

#endif /* TRACK_SERVER_H */
