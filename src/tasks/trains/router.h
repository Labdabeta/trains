#ifndef ROUTER_H
#define ROUTER_H

#define ROUTING_SERVER_NAME "ROUTE"

#include "track_server.h"

void setTrainLoop(int tid, train_id train, struct Sensor a, struct Sensor b);
void setTrainDestination(int tid, train_id train, struct Sensor dest);

#endif /* ROUTER_H */
