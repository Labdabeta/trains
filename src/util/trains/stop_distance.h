#ifndef STOP_DISTANCE_H
#define STOP_DISTANCE_H

#include "trains/path_finder.h"

void initStopDistance(void);

struct StopOutput {
    int stopIndex;
    int stopTime;
};
struct StopOutput getStopDistance(struct RestrictedPath *path, int train);

#endif /* STOP_DISTANCE_H */
