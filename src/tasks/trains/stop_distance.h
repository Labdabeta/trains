#ifndef STOP_DISTANCE_H
#define STOP_DISTANCE_H

#include "trains/movement.h"

// Does not populate the isCaboose field
struct Movement makeMovement(struct RestrictedPath *path, int train);

#endif /* STOP_DISTANCE_H */
