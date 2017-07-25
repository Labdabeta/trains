#ifndef MOVEMENT_H
#define MOVEMENT_H

#include "trains/path_finder.h"

struct Movement {
    struct RestrictedPath path;
    int isCaboose;
    //int speed;
    int stopIndex; // number of sensors back after which to issue stop
    int stopTime; // number of ticks after it to issue it
};

// Spawns a temporary task to move the train
int moveTrain(int train, struct Movement movement, int reservation_tid, int track_tid, int clock_tid);

#endif /* MOVEMENT_H */
