#ifndef RESERVATION_H
#define RESERVATION_H

#include "trains/sensors.h"
#include "trains/switches.h"

struct ReservationSystem {

};

struct TrackSpace {
    int isSwitch;
    union {
        struct {
            struct Sensor src;
            struct Sensor dst;
        } inter;
        int sw;
    } space;
};


void initReservation(struct ReservationSystem *r);

int reserveSpace(struct ReservationSystem *r, struct TrackSpace space, int train);

/* Returns previous owner, or -1 for no owner. */
int takeSpace(struct ReservationSystem *r, struct TrackSpace space, int train);
int whoOwnsSpace(struct ReservationSystem *r, struct TrackSpace space);

#endif /* RESERVATION_H */
