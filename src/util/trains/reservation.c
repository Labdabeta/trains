#include "trains/reservation.h"

void initReservation(struct ReservationSystem *r)
{
    int i;
    for (i = 0; i < TRACK_MAX; ++i)
        r->whoOwns[i] = 0;
}

int reserveSpace(struct ReservationSystem *r, struct TrackSpace space, int train)
{
    if (space.isSwitch) {
        // Claim in and out versions of the switch (80 + 2sw and 80 + 2sw + 1)
        int owner = r->whoOwns[80 + (space.space.sw << 1)] | r->whoOwns[80 + (space.space.sw << 1) + 1];
        if (owner) return owner;
        r->whoOwns[80 + (space.space.sw << 1)] = 1 << train;
        r->whoOwns[80 + (space.space.sw << 1) + 1] = 1 << train;
        return 0;
    } else {
        // Claim forward and reverse versions of both sensors
        int owner = r->whoOwns[S_ID(space.space.inter.src)] |
                    r->whoOwns[S_ID(space.space.inter.dst)] |
                    r->whoOwns[S_ID(getReverseSensor(space.space.inter.src))] |
                    r->whoOwns[S_ID(getReverseSensor(space.space.inter.dst))];
        if (owner) return owner;
        r->whoOwns[S_ID(space.space.inter.src)] = 1 << train;
        r->whoOwns[S_ID(space.space.inter.dst)] = 1 << train;
        r->whoOwns[S_ID(getReverseSensor(space.space.inter.src))] = 1 << train;
        r->whoOwns[S_ID(getReverseSensor(space.space.inter.dst))] = 1 << train;
        return 0;
    }
}

void clearSpace(struct ReservationSystem *r, struct TrackSpace space)
{
    if (space.isSwitch) {
        r->whoOwns[80 + (space.space.sw << 1)] = 0;
        r->whoOwns[80 + (space.space.sw << 1) + 1] = 0;
    } else {
        r->whoOwns[S_ID(space.space.inter.src)] = 0;
        r->whoOwns[S_ID(space.space.inter.dst)] = 0;
        r->whoOwns[S_ID(getReverseSensor(space.space.inter.src))] = 0;
        r->whoOwns[S_ID(getReverseSensor(space.space.inter.dst))] = 0;
    }
}

int takeSpace(struct ReservationSystem *r, struct TrackSpace space, int train)
{
    if (space.isSwitch) {
        // Claim in and out versions of the switch (80 + 2sw and 80 + 2sw + 1)
        int owner = r->whoOwns[80 + (space.space.sw << 1)] | r->whoOwns[80 + (space.space.sw << 1) + 1];
        r->whoOwns[80 + (space.space.sw << 1)] = 1 << train;
        r->whoOwns[80 + (space.space.sw << 1) + 1] = 1 << train;
        return owner;
    } else {
        // Claim forward and reverse versions of both sensors
        int owner = r->whoOwns[S_ID(space.space.inter.src)] |
                    r->whoOwns[S_ID(space.space.inter.dst)] |
                    r->whoOwns[S_ID(getReverseSensor(space.space.inter.src))] |
                    r->whoOwns[S_ID(getReverseSensor(space.space.inter.dst))];
        r->whoOwns[S_ID(space.space.inter.src)] = 1 << train;
        r->whoOwns[S_ID(space.space.inter.dst)] = 1 << train;
        r->whoOwns[S_ID(getReverseSensor(space.space.inter.src))] = 1 << train;
        r->whoOwns[S_ID(getReverseSensor(space.space.inter.dst))] = 1 << train;
        return owner;
    }
}

int whoOwnsSpace(struct ReservationSystem *r, struct TrackSpace space)
{
    if (space.isSwitch) {
        // Claim in and out versions of the switch (80 + 2sw and 80 + 2sw + 1)
        return r->whoOwns[80 + (space.space.sw << 1)] | r->whoOwns[80 + (space.space.sw << 1) + 1];
    } else {
        // Claim forward and reverse versions of both sensors
        return r->whoOwns[S_ID(space.space.inter.src)] |
               r->whoOwns[S_ID(space.space.inter.dst)] |
               r->whoOwns[S_ID(getReverseSensor(space.space.inter.src))] |
               r->whoOwns[S_ID(getReverseSensor(space.space.inter.dst))];
    }
}

void getRestrictions(struct ReservationSystem *r, int train, struct Restrictions *rest)
{
    int i;
    if (train >= 0) {
        // Specific train
        int mask = 1 << train;
        for (i = 0; i < TRACK_MAX; ++i)
            rest->isEnabled[i] = !(r->whoOwns[i] & ~mask);
    } else {
        // any train
        for (i = 0; i < TRACK_MAX; ++i)
            rest->isEnabled[i] = !r->whoOwns[i];
    }
}