#ifndef HOTEL_H
#define HOTEL_H

#define RESERVATION_SERVER_NAME "HOTEL"

#include "trains/reservation.h"

int queryOwner(int tid, struct TrackSpace space);
int requestSpace(int tid, struct TrackSpace space, int train); // 0 = success
int stealSpace(int tid, struct TrackSpace space, int train); // returns previous
void freeSpace(int tid, struct TrackSpace space, int train);

// >=0 = distance, -1 = failure
int getFreePath(int tid, int train, struct Sensor src, struct Sensor dst, struct RestrictedPath *path);

// returns which space became available
struct TrackSpace waitForAvailability(int tid);

#endif /* HOTEL_H */
