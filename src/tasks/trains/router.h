#ifndef ROUTER_H
#define ROUTER_H

#include "track_server.h"

void setTrainLoop(train_id train, struct Sensor a, struct Sensor b);
void setTrainDestination(train_id train, struct Sensor dest);

#endif /* ROUTER_H */
