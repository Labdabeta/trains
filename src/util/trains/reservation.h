#ifndef RESERVATION_H
#define RESERVATION_H

// NOTE: Claiming sensors does NOT claim the switches between them.

#include "trains/track_data.h"
#include "trains/sensors.h"
#include "trains/switches.h"
#include "trains/path_finder.h"

struct ReservationSystem {
    int whoOwns[TRACK_MAX];
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

/* 0 = success. */
int reserveSpace(struct ReservationSystem *r, struct TrackSpace space, int train);
void clearSpace(struct ReservationSystem *r, struct TrackSpace space);

/* Returns a previous owner bitmask, or 0 for no owner. */
int takeSpace(struct ReservationSystem *r, struct TrackSpace space, int train);
int whoOwnsSpace(struct ReservationSystem *r, struct TrackSpace space);

// -1 for any train
void getRestrictions(struct ReservationSystem *r, int train, struct Restrictions *rest);

#define SWITCH_SPACE(X) (struct TrackSpace){.isSwitch = 1, .space.sw = (X)}
#define SENSOR_SPACE(X,Y) (struct TrackSpace){.isSwitch = 0, .space.inter = {(X),(Y)}}

#endif /* RESERVATION_H */
